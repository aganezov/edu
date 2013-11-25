declare
nz zipcodes.zip%type;
oz zipcodes.zip%type;
procedure th_t(
	old_zip in zipcodes.zip%type,
	new_zip in zipcodes.zip%type )
is
begin
	insert into zipcodes values (new_zip, (select city from zipcodes where zip = old_zip));
	update employees set zip = new_zip where zip = old_zip;
	update customers set zip = new_zip where zip = old_zip;
	delete from zipcodes where zip = old_zip;
end;
begin
	oz := 67226;
	nz := 67225;
	th_t(oz, nz);
	
	oz := 61111;
	nz := 61112;
	th_t(oz, nz);
end;
/
