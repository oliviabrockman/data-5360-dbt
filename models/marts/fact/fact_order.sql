select
    {{ dbt_utils.generate_surrogate_key(['order_id']) }} as order_key,
    order_id,
    dc.customer_key,
    order_timestamp
from {{ ref('stg_order') }} o
left join {{ ref('dim_customer') }} dc
    on o.customer_id = dc.customer_id