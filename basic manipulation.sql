select Name as 'Customer', concat(City, ', ', State) as Location, 
	orders.Id as 'Order ID', format(Date, 'yyyy | MMM | dd') as 'Order Date'

		from orders
		join Customers
			on orders.CustomerId = customers.Id

			--where (customers.name = 'KFC')
			--where orders.Id >= 2020 and orders.id <= 2040

	order by name,date desc;
