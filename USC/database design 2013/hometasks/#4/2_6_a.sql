update parts p
set p.price = 0.85*(select price from parts where pno=p.pno)
where p.price < 20.00;
