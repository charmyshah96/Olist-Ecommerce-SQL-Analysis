SELECT customer_state,
COUNT(*) AS Total_Customers
FROM dbo.Raw_Customers
GROUP BY customer_state
ORDER BY Total_Customers DESC;

SELECT 
    SUM(price) AS total_revenue
FROM dbo.Raw_OrderItems;

SELECT 
dbo.Raw_Customers.customer_state,
SUM(dbo.Raw_OrderItems.price) AS total_revenue
FROM dbo.Raw_Customers
JOIN dbo.Raw_Orders
ON dbo.Raw_Customers.customer_id = dbo.Raw_Orders.customer_id
JOIN dbo.Raw_OrderItems
ON dbo.Raw_Orders.order_id = dbo.Raw_OrderItems.order_id
GROUP BY dbo.Raw_Customers.customer_state
ORDER BY total_revenue DESC;

SELECT TOP 5
dbo.Raw_Orders.order_status,
SUM(dbo.Raw_OrderItems.freight_value) AS total_shipping_cost
FROM dbo.Raw_Orders
JOIN  dbo.Raw_OrderItems
ON dbo.Raw_Orders.order_id = dbo.Raw_OrderItems.order_id
GROUP BY dbo.Raw_Orders.order_status
ORDER BY total_shipping_cost DESC;

SELECT TOP 10
    dbo.Raw_Customers.customer_unique_id,
    SUM(dbo.Raw_OrderItems.price) AS total_spent
FROM dbo.Raw_Customers
JOIN dbo.Raw_Orders 
    ON dbo.Raw_Customers.customer_id = dbo.Raw_Orders.customer_id
JOIN dbo.Raw_OrderItems 
    ON dbo.Raw_Orders.order_id = dbo.Raw_OrderItems.order_id
GROUP BY dbo.Raw_Customers.customer_unique_id
ORDER BY total_spent DESC;
