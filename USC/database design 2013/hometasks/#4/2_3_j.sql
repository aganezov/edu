select c.cname as "customer name"
from customers c
 join
     orders o
 on
     c.cno = o.cno
where o.ono =
(select * from 
(select o.ono 
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
order by -sum(od.qty*p.price))
where rownum=1);
