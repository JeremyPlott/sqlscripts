--select * from Customers;
--select name,city,state from Customers;
/*
select * from customers 
	where (state = 'OH') or (state = 'KY')
		order by state desc,name;


select * from Customers
	where (city = 'Jersey city');
*/

select count(state) from Customers
	where (state = 'OH') or (state = 'KY')