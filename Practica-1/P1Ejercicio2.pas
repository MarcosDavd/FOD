Program P1Ejercicio2;
{2. Realizar un algoritmo, que utilizando el archivo de números enteros no ordenados
creados en el ejercicio 1, informe por pantalla cantidad de números menores a 1500 y
el promedio de los números ingresados. El nombre del archivo a procesar debe ser
proporcionado por el usuario una única vez. Además, el algoritmo deberá listar el
contenido del archivo en pantalla}
type
	cadena=String[50];
	archivo=file of integer;
var
	arch:archivo;
	nombre:cadena;
	numero:integer;
	cant:integer;
begin
	cant:=0;
	writeln('Ingrese el nombre del archivo a procesar');
	readln(nombre);
	assign(arch,nombre);
	reset(arch);
	while( not EOF(arch))do
	begin
		read(arch, numero);
		writeln(numero);
		if(numero>1500)then
		begin
			cant:=cant+1;
		end;	
	end;
	writeln('La cantidad de numero mayores a 1500 es :',cant);
	close(arch);
	
end.
