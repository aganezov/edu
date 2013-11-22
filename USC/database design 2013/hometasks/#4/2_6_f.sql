delete from orders o
where o.eno in (
select or_d.eno 
from orders or_d
 join
     odetails or_de
 on
     or_d.ono = or_de.ono
 join
     parts part
 on
     part.pno = or_de.pno
group by or_d.eno
having sum(or_de.qty*part.price) = (select min(sum(od.qty*p.price))
from orders o
 join
     odetails od
 on
     o.ono = od.ono
 join
     parts p
 on
     od.pno = p.pno
group by o.eno));

