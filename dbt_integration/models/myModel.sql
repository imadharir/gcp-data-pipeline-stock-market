with staged_data as (
    select
        CloseUSD,
        `Adj Close` as Adj_Close,
        Close,
        Open,
        Low,
        Volume,
        High,
        Date,
        Index,
        row_number() OVER(PARTITION BY Date, Index ORDER BY DATE) as row_num
    from
        {{ ref('stg_stockMarket') }}
        
    
),
deduplicated_data as (
    select
        cast(row_num as int) as id,
        CloseUSD,
        Adj_Close,
        Close,
        Open,
        Low,
        Volume,
        High,
        Date,
        Index
    from
        staged_data
    where row_num = 1
    order by Date, Index
)

select
    CONCAT(Date, '_', Index) as id,
    CloseUSD,
    Adj_Close,
    Close,
    Open,
    Low,
    Volume,
    High,
    Date,
    Index
from
    deduplicated_data
order by id

