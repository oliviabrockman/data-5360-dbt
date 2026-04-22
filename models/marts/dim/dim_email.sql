select
    {{ dbt_utils.generate_surrogate_key(['email_id']) }} as email_key,
    email_id,
    max(subscriber_email) as email_address,
    max(send_timestamp) as send_timestamp
from {{ ref('stg_marketingemails') }}
where email_id is not null
group by email_id