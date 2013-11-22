select cname as "customer name"
from
customers c
where not exists
(
	select * 
	from parts p, odetails od
	where p.pno = od.pno and p.price < 20.0
	and not exists
	(
		select *
		from orders o
		where c.cno = o.cno and o.ono = od.ono 
	)
);
