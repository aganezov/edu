create table customers (
	cno number(6) primary key,
	cname varchar2(30),
	street varchar2(30),
	zip number(5) references zipcodes(zip),
	phone char(12)
);
