CREATE VIEW FullRequests as
SELECT r.Id 'Request ID', r.Status, r.Total, u.Lastname 'User',
	   v.Name 'Vendor', p.Name 'Product', p.Price, l.Quantity, (p.Price * l.Quantity) 'Subtotal'
	from Requests r
	join RequestLines l
		on r.Id = l.Id
	join Products p
		on l.ProductId = p.Id
	join Vendors v
		on p.VendorId = v.Id
	join Users u
		on u.Id = r.UserId