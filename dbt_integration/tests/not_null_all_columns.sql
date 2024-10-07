  WITH null_counts AS (
    SELECT
        COUNT(CASE WHEN id IS NULL THEN 1 END) AS null_count_id,
        COUNT(CASE WHEN CloseUSD IS NULL THEN 1 END) AS null_count_CloseUSD,
        COUNT(CASE WHEN Adj_Close IS NULL THEN 1 END) AS null_count_Adj_Close,
        COUNT(CASE WHEN Close IS NULL THEN 1 END) AS null_count_Close,
        COUNT(CASE WHEN Open IS NULL THEN 1 END) AS null_count_Open,
        COUNT(CASE WHEN Low IS NULL THEN 1 END) AS null_count_Low,
        COUNT(CASE WHEN Volume IS NULL THEN 1 END) AS null_count_Volume,
        COUNT(CASE WHEN High IS NULL THEN 1 END) AS null_count_High,
        COUNT(CASE WHEN Date IS NULL THEN 1 END) AS null_count_Date,
        COUNT(CASE WHEN Index IS NULL THEN 1 END) AS null_count_Index
    FROM `stockmarketrealtimedataanalysi`.`dbt_dataset`.`myModel`
)

SELECT
    null_count_id,
    null_count_CloseUSD,
    null_count_Adj_Close,
    null_count_Close,
    null_count_Open,
    null_count_Low,
    null_count_Volume,
    null_count_High,
    null_count_Date,
    null_count_Index
FROM null_counts
WHERE 
    null_count_id > 0 OR
    null_count_CloseUSD > 0 OR
    null_count_Adj_Close > 0 OR
    null_count_Close > 0 OR
    null_count_Open > 0 OR
    null_count_Low > 0 OR
    null_count_Volume > 0 OR
    null_count_High > 0 OR
    null_count_Date > 0 OR
    null_count_Index > 0