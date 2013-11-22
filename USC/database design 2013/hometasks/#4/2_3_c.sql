select  t1.cno as "customer number 1", t2.cno as "customer number 2"
from customers t1 
	join 
     customers t2
on t1.zip = t2.zip
where t1.cno > t2.cno;
