"""Execute the notebook with this Python; keep kernel registration temporary."""

import os
from pathlib import Path
import subprocess
import sys
from tempfile import TemporaryDirectory

import nbformat
from nbclient import NotebookClient


ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "notebooks/customer_churn_prediction.ipynb"
OUTPUT = ROOT / "reports/customer_churn.executed.ipynb"


def main():
    with TemporaryDirectory(prefix="churn-kernel-") as temporary:
        os.environ["IPYTHONDIR"] = str(Path(temporary) / "ipython")
        os.environ["JUPYTER_RUNTIME_DIR"] = str(Path(temporary) / "runtime")
        subprocess.run(
            [sys.executable, "-m", "ipykernel", "install", "--prefix", temporary,
             "--name", "churn", "--display-name", "Customer Churn"],
            check=True, capture_output=True, text=True,
        )
        previous = os.environ.get("JUPYTER_PATH", "")
        os.environ["JUPYTER_PATH"] = str(Path(temporary) / "share/jupyter") + (
            os.pathsep + previous if previous else ""
        )
        notebook = nbformat.read(SOURCE, as_version=4)
        nbformat.validate(notebook)

        def report_progress(cell, cell_index):
            if cell.cell_type == "code":
                print(f"Executing cell {cell_index + 1}/{len(notebook.cells)}", flush=True)

        NotebookClient(
            notebook, timeout=600, kernel_name="churn",
            resources={"metadata": {"path": str(ROOT)}},
            on_cell_start=report_progress,
        ).execute()
        OUTPUT.parent.mkdir(exist_ok=True)
        nbformat.write(notebook, OUTPUT)
    print(f"Executed with Python {sys.version.split()[0]}: {OUTPUT}")
    print(f"Recomputed tables: {ROOT / 'reports'}")


if __name__ == "__main__":
    main()
