create table employees (
	eno number(6) primary key,
	ename varchar2(30),
	zip number(5) references zipcodes(zip),
	hdate date
);
