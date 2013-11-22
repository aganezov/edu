create table orders (
	ono number(10) primary key,
	cno number(6) references customers(cno),
	eno number(6) references employees(eno),
	recieved date,
	shipped date
);
