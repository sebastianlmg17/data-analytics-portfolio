# Data Preparation

## Missing Values

- `estabilidad_laboral`: imputed with median **4.2**.
- `cuenta_corriente`: replaced with category **desconocido**.

## Categorical Encoding

One-Hot Encoding was applied to `propiedad_vivienda`, `tipo_empleo`, `tipo_contrato`, `tipo_credito_activo`, `proposito_credito`, `ahorros` and `cuenta_corriente`.

## Train / Test Split

- Training: 39,970 rows
- Test: 10,030 rows

The same test set was used for all three algorithms.
