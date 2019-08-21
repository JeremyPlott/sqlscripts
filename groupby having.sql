/*
select
	sum(sales)
	
	from Customers

		where city = 'Cincinnati'
*/


/*
select
	City, 
	count(*) 'No. of customers', 
	sum(sales) 'Sales Total'

	from Customers

		group by City

			having sum(sales) >= 600000

	order by [Sales Total] desc
*/

--A = top 20%, 80% of sales.
--B = mid 60%, 15% of sales.
--C = bot 20%,  5% of sales.
--Show customers who have sales > avg sales of all customers

select
	*

	from Customers

		where customers.sales > (select avg(customers.sales) from customers)

	order by customers.sales desc