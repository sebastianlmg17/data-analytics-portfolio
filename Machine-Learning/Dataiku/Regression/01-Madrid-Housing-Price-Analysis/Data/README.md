# Data snapshots

The six source CSV exports are preserved byte for byte under descriptive names. Each snapshot is stored once in this folder. Numbering describes data dependencies, not the historical order in which the project analyses were performed: the mapping is an auxiliary input, and the cleaned exports already reflect the later duplicate review.

## Verified inventory

| Snapshot | Original export | Rows × columns | Verified content or relationship |
| --- | --- | ---: | --- |
| [01-raw-idealista-madrid.csv](01-raw-idealista-madrid.csv) | `idealista_madrid.csv` | 915 × 13 | Original listings, identifiers, descriptions, location and typology. |
| [02-cleaned-housing-data.csv](02-cleaned-housing-data.csv) | `idealista_madrid_Clean.csv` | 911 × 7 | Retains price, baths, rooms, sqft and address; replaces typology with Pisos and Independientes. Four fewer row occurrences than the projected raw data. |
| [03-address-district-mapping.csv](03-address-district-mapping.csv) | `address_to_district.csv` | 105 × 2 | Auxiliary address-to-district lookup with 105 unique addresses. This is not a housing observation snapshot derived from file 02. |
| [04-housing-with-district.csv](04-housing-with-district.csv) | `address_to_district_joined.csv` | 911 × 8 | Exactly the result of joining 02 to 03 on address; all 911 observations retained, with 21 districts. |
| [05-model-ready-data.csv](05-model-ready-data.csv) | `address_to_district_joined_prepared-2.csv` | 911 × 25 | Replaces district with 20 binary columns; omits address and Pisos. Arganzuela and Pisos are the reference categories. Numeric values are unchanged. |
| [06-model-ready-data-with-size-groups.csv](06-model-ready-data-with-size-groups.csv) | `address_to_district_joined_prepared_prepared_cleaned.csv` | 911 × 26 | Exactly the same 25 columns and row order as 05, plus size_range; no further rows removed. |

## Schema and data-quality checks

All processed exports have zero missing values. The raw export has one missing value. The raw file has 13 columns and no `index` column.

The two typology indicators are mutually exclusive and exhaustive: 777 rows have `Pisos = 1` and 134 have `Independientes = 1`. The district encoding was checked against the joined district labels for every row.

Full-row duplicate counts are 0, 41, 0, 41, 66 and 66 in files 01–06 respectively. Identical rows after removing listing identifiers do not by themselves prove duplicate properties. These rows have been preserved. The four removed row occurrences are consistent with the documented duplicate review; the reduced exports cannot independently establish property identity or reconstruct every Dataiku recipe.

`size_range` matches these rules on every row: Q1 - Small (`sqft <= 104`), Q2 - Medium (`104 < sqft <= 158`), Q3 - Large (`158 < sqft <= 264`), Q4 - Very Large (`sqft > 264`). The historical ANOVA used 915 observations; file 06 is its later 911-row cleaned counterpart, not the exact original ANOVA input.

The name `sqft` is retained as exported. Coefficients are expressed per recorded unit of built area; the CSV header alone does not verify a physical unit conversion. Snapshots establish their observed differences, but do not reveal transient missing values, intermediate recipes, split settings or the exact timing of each operation.

### Exact columns

- **01-raw-idealista-madrid.csv**: `url`, `listingUrl`, `title`, `id`, `price`, `baths`, `rooms`, `sqft`, `description`, `address`, `typology`, `advertiserProfessionalName`, `advertiserName`.
- **02-cleaned-housing-data.csv**: `price`, `baths`, `rooms`, `sqft`, `address`, `Pisos`, `Independientes`.
- **03-address-district-mapping.csv**: `address`, `district`.
- **04-housing-with-district.csv**: `address`, `district`, `price`, `baths`, `rooms`, `sqft`, `Pisos`, `Independientes`.
- **05-model-ready-data.csv**: `Usera`, `Chamberí`, `San Blas-Canillejas`, `Moncloa-Aravaca`, `Barajas`, `Salamanca`, `Tetuán`, `Chamartín`, `Carabanchel`, `Villaverde`, `Latina`, `Hortaleza`, `Centro`, `Ciudad Lineal`, `Vicálvaro`, `Villa de Vallecas`, `Retiro`, `Fuencarral-El Pardo`, `Moratalaz`, `Puente de Vallecas`, `price`, `baths`, `rooms`, `sqft`, `Independientes`.
- **06-model-ready-data-with-size-groups.csv**: `Usera`, `Chamberí`, `San Blas-Canillejas`, `Moncloa-Aravaca`, `Barajas`, `Salamanca`, `Tetuán`, `Chamartín`, `Carabanchel`, `Villaverde`, `Latina`, `Hortaleza`, `Centro`, `Ciudad Lineal`, `Vicálvaro`, `Villa de Vallecas`, `Retiro`, `Fuencarral-El Pardo`, `Moratalaz`, `Puente de Vallecas`, `price`, `baths`, `rooms`, `sqft`, `size_range`, `Independientes`.
