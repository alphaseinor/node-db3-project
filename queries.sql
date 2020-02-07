-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

select p.ProductName, c.CategoryName
from Product as p
left join Category as c
on p.id = c.Id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

select o.id, s.CompanyName
from [order] as o
join Shipper as s on o.ShipVia = s.Id
where o.OrderDate < '2012-08-09';

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

select p.ProductName, p.QuantityPerUnit
from product as p
join orderdetail as od
on p.id = od.ProductId
where od.orderid = 10251

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

select o.id as "Order ID", c.CompanyName as "Customer's Company Name", e.LastName as "Employee Last Name"
from [order] as o
join customer as c on o.CustomerId = c.Id
join employee as e on o.EmployeeId = e.id