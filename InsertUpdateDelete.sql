/*
insert into Customers (name, city, state, sales, active)
			values ('Jumanji', 'Tokyo', 'OH', 200.00, 1)

select * from customers where name = 'Jumanji'
*/

/*
insert into Orders (CustomerId, 
					Date, 
					Description)

			values (
				   (select Id from Customers where name = 'verizon'),
				   '2019-08-21', 
				   'lego machine'
				   );
*/


/*
select
	*

	from Orders
	join Customers
		on customers.Id = orders.CustomerId

			where orders.id = (select max(id) from Orders)

*/

/*
update orders set
					description = 'Large bubble',
					CustomerId  = (select Id from Customers where name = 'Kroger')

						where id = 29

select * 
	from Orders 
	join Customers
		on Customers.Id = Orders.Id

		where Orders.Id = 29
*/

--delete by primary key

/*
delete from orders
	where id = 29
	where id in (x,y,z)
*/