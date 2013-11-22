create table zipcodes (
	zip number(5) primary key,
	city varchar2(45)
);

create table employees (
	eno number(6) primary key,
	ename varchar2(30) not null,
	zip number(5) references zipcodes(zip),
	hdate date
);

create table parts (
	pno number(10) primary key,
	pname varchar2(30),
	qoh integer,
	price number(8,2),
	level integer,
	constraint check_qoh_for_non_negativity check(qoh>=0),
	constraint check_price_for_non_negativity check(price>=0.0)
);

create table customers (
	cno number(6) primary key,
	cname varchar2(30),
	street varchar2(30),
	zip number(5) references zipcodes(zip),
	phone char(12),
);

create table orders (
	ono number(10) primary key,
	cno number(6) references customers(cno),
	eno number(6) references employees(eno),
	recieved date,
	shipped date,
);

create table odetails (
	ono number(10) references orders(ono),
	pno number(10) references parts(pno),
	qty integer,
	primary key(ono, pno),
	constraint check_quantity_for_positivity check(qty > 0)
);