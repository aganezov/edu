set serveroutput on;
accept ac number prompt 'Enter area code: '
declare
area_code number := &ac;
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
