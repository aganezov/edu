select distinct c.cname as "customer name"
from customers c
 join
     orders o
 on
     c.cno = o.cno
where o.ono in (select o.ono
	from orders o
 	join
    	 odetails od
	 on 
	     o.ono = od.ono
	 join
	     parts p
	 on
	     p.pno = od.pno
	group by o.ono
	having sum(od.qty*p.price) >= all (select sum(od.qty*p.price)
		from odetails od
 		join
     		parts p
 		on
     		od.pno = p.pno
			group by od.ono));
