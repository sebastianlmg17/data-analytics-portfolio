# 02 - Feature Engineering

## Purpose

The cleaned transaction data was prepared for modeling while retaining the documented cleaning decisions: remove the identifier and invalid negative values, and retain statistical outliers.

## 1. Encode Categorical Variables

One-Hot Encoding was applied to:

- `dispositivo`
- `pais_origen`
- `tipo_transaccion`
- `metodo_pago`

These categories have no natural numerical ordering. Empty cells created by the encoding were filled with `0`, and the four original categorical columns were removed.

`cuenta_nueva` was retained as a binary 0/1 variable and `es_fraude` as the target.

## 2. Configure KNN Preprocessing

| Variables | Role | Rescaling |
| --- | --- | --- |
| `monto`, `tiempo_transcurrido`, `cantidad_transacciones_24h`, `distancia_ip` | Input | Standard rescaling / Avg std |
| All One-Hot dummy variables | Input, ON | No rescaling |
| `cuenta_nueva` | Input, ON | No rescaling |
| `es_fraude` | Target | Not a predictor |

For **Gaussian Naive Bayes**, rescaling was disabled for all features, including the four numerical variables. The same One-Hot variables and `cuenta_nueva` remained active inputs.

## Final Inputs

Both models used the same 27 predictors, excluding the target.

## Next Stage

[03 - KNN](../03-KNN-Model/) documents the split, hyperparameter search and final evaluation.
