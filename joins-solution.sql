--Tasks

--Get all customers and their addresses.

select
    customers.first_name, customers.last_name, addresses.street, addresses.state, addresses.city, addresses.zip
from
    customers
join
    addresses
on 
    customers.id = addresses.customer_id
;

--Get all orders and their line items (orders, quantity and product).

select
    orders.order_date, line_items.quantity, products.description, line_items.order_id
from
    orders
join
    line_items
on 
    orders.id = line_items.order_id
join
    products
on 
    products.id = line_items.product_id
;


--Which warehouses have cheetos?

select
    products.description, warehouse.warehouse
from
    warehouse_product
join
    warehouse
on 
    warehouse.id = warehouse_product.warehouse_id
join
    products
on
    products.id = warehouse_product.product_id
where
description = 'cheetos'
;



--Which warehouses have diet pepsi?

select
    products.description, warehouse.warehouse
from
    warehouse_product
join
    warehouse
on 
    warehouse.id = warehouse_product.warehouse_id
join
    products
on
    products.id = warehouse_product.product_id
where
description = 'diet pepsi'
;


--Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.



select
    customers.first_name,
    customers.last_name,
    count(orders.address_id)
from
    customers
join
    addresses
on 
    customers.id = addresses.customer_id
join
    orders
on 
    addresses.id = orders.address_id
group by 
    customers.first_name,
    customers.last_name
;


--How many customers do we have?

select
    count(*)
from
    customers;

--How many products do we carry?

select
    count(*)
from
    products
;

--What is the total available on-hand quantity of diet pepsi?

select
    sum(on_hand),
    products.description
from
    products
join
    warehouse_product
on 
    products.id = warehouse_product.product_id
where
    products.description = 'diet pepsi'
group by 
    products.description
;
