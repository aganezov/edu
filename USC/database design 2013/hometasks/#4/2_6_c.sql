update parts p 
set p.price = (select price from parts where p.pno = pno) - 10
where p.price >= (select avg(price) from parts);
