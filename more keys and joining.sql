select format(Date, 'MMM/dd/yyyy') 'Order date', c.Name 'Customer', p.Name 'Product', Price, Quantity,
	(quantity * price)  'Line subtotal'

	from OrderLines ol			 --aliasing the table name. The alias MUST be used once assigned.
	join Orders o
		on ol.OrderId = o.Id
	join Products p
		on ol.ProductId = p.Id   --name FK by tableColumn, OrderId. PantsBlue, etc.
	join Customers c
		on c.id = o.CustomerId

		--where o.id = 2002

	order by customer, [Line subtotal] desc;