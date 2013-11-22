create table parts (
	pno number(10) primary key,
	pname varchar2(30),
	qoh integer,
	price number(8,2),
	olevel integer,
	constraint check_qoh_for_non_negativity check(qoh>=0),
	constraint check_price_for_non_negativity check(price>=0.0)
);
