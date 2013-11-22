create table odetails (
	ono number(10) references orders(ono),
	pno number(10) references parts(pno),
	qty integer,
	primary key(ono, pno),
	constraint check_quantity_for_positivity check(qty > 0)
);
