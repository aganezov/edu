select c.cname as "customer name"
from customers c
 join
     orders o
 on
     c.cno = o.cno
where (to_date(o.shipped) - to_date(o.recieved)) = (select max(to_date(shipped) - to_date(recieved)) from orders);
