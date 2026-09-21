# 02 - Feature Engineering

## Purpose

Prepare the cleaned transaction data for modeling while retaining the documented cleaning decisions: remove the identifier and invalid negative values, and retain statistical outliers.

## 1. Encode Categorical Variables

Apply One-Hot Encoding to:

- `dispositivo`
- `pais_origen`
- `tipo_transaccion`
- `metodo_pago`

These categories have no natural numerical ordering. Fill empty cells created by the encoding with `0`, then remove the four original categorical columns to avoid duplicating the same information.

Keep `cuenta_nueva` as a binary 0/1 variable and `es_fraude` as the target.

## 2. Configure KNN Preprocessing

| Variables | Role | Rescaling |
| --- | --- | --- |
| `monto`, `tiempo_transcurrido`, `cantidad_transacciones_24h`, `distancia_ip` | Input | Standard rescaling / Avg std |
| All One-Hot dummy variables | Input, ON | No rescaling |
| `cuenta_nueva` | Input, ON | No rescaling |
| `es_fraude` | Target | Not a predictor |

This is the final KNN configuration; preprocessing decisions for the next model have not yet been documented.

## 3. Verify the Effective Inputs

In Dataiku, check **Model Information → Algorithm** after training:

| Check | Final result |
| --- | ---: |
| Columns before preprocessing | 28 |
| Features after preprocessing | 27 |

The target is not used as an input feature.

## Methodological Correction

The initial KNN execution retained only 5 features because the One-Hot inputs had been disabled. The ON/OFF switch controls whether a feature enters the model; it does not control scaling.

The correction was to restore the dummy variables as **Input/ON**, change only their rescaling setting to **No rescaling**, and retrain. The final run confirmed 27 features. Results from the incomplete run are superseded and must not be used as the final KNN benchmark.

## Next Stage

[03 - KNN](../03-KNN/) documents the split, hyperparameter search and final evaluation.
