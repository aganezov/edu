set serveroutput on;
accept ac number(3) promt 'Enter area code: '
declare
area_code number(3) := &ac;
procedure area(area_code in number)
is
begin
	for customer in (select cname, street
			from customers
			where phone like to_char(area_code) || '%')
	loop
		dbms_output.put_line( customer.cname || '  ' || customer.street );
	end loop;  
end;
begin
	area(area_code);
end;
/
