Program P1ejercicio1;
{1. Realizar un algoritmo que cree un archivo de números enteros no ordenados y permita
incorporar datos al archivo. Los números son ingresados desde teclado. El nombre del
archivo debe ser proporcionado por el usuario desde teclado. La carga finaliza cuando
se ingrese el número 30000, que no debe incorporarse al archivo.}
type
	cadena=String[50];
	archivo=file of integer;
var 
	nom_Fisico:cadena;
	nom_Logico:archivo;
	num:integer;
begin
	writeln('Ingrese el nombre del archivo');
	readln(nom_Fisico);
	assign(nom_Logico, nom_Fisico);
	rewrite(nom_Logico);
	writeln('Ingrese el numero para agregar');
	readln(num);
	while(num<>30000)do
	begin
		write(nom_Logico,num);
		writeln('Ingrese el numero para agregar');
		readln(num);
	end;
	Close(nom_Logico);
end.
