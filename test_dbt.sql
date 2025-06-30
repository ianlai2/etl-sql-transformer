with cleaned as (

    select
        id as order_id,
        customer_id, 
        cast(order_date as date) as order_date,
        cast(amount as numeric) as order_amount,
        {{ dbt_utils.star(from=ref('raw_orders')) }}
    from {{ ref('raw_orders') }}
    where order_date = '{{ execution_date }}'
{% if is_incremental() %}
  and updated_at > (select MAX(updated_at) from {{ this }})
{% endif %}

)