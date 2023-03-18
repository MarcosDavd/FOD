program P1Ejercicio3;
{3. Realizar un programa que presente un menú con opciones para:
a.	 Crear un archivo de registros no ordenados de empleados y completarlo con
	datos ingresados desde teclado. De cada empleado se registra: número de
	empleado, apellido, nombre, edad y DNI. Algunos empleados se ingresan con
	DNI 00. La carga finaliza cuando se ingresa el String ‘fin’ como apellido

b. 	 Abrir el archivo anteriormente generado y
	i. 	Listar en pantalla los datos de empleados que tengan un nombre o apellido
		determinado.
	ii. Listar en pantalla los empleados de a uno por línea.
	iii. Listar en pantalla empleados mayores de 70 años, próximos a jubilarse.

NOTA: El nombre del archivo a crear o utilizar debe ser proporcionado por el usuario.}

type
	cadena1=string[15];
	cadena2=string[50];
	Empleado=record
		numEmpleado:integer;
		apellido:cadena1;
		nombre:cadena1;
		edad:integer;
		dni:integer;
	end;
	archivo=file of Empleado;
procedure mostrar(e:Empleado);
begin
	with e do
	begin
		writeln(' Numeros de Empleado : ',numEmpleado);
		writeln(' Nombre : ',nombre);
		writeln(' Apellido : ',apellido);
		writeln(' Dni : ',dni);
		writeln(' Edad : ',edad);
		
	end;
end;
procedure LeerEmpleado(var e:Empleado);
begin
	writeln('Ingrese su Apellido :');
	readln(e.apellido);
	if(e.apellido <> 'fin')then
	begin
		writeln('Ingrese su Nombre :');
		readln(e.nombre);
		writeln('Ingrese su Numero de Empleado');
		readln(e.numEmpleado);
		writeln('Ingrese su Edad :');
		readln(e.edad);
		writeln('Ingrese su DNI :');
		readln(e.dni);
	end;
end;
procedure opcionUNO(var archivoEmp:archivo);
var
	e:Empleado;
	nomFisico:cadena2;
begin
	writeln('Ingrese el nombre del archivo(Agregar pat si se desea guardar en otra carpeta:');
	readln(nomFisico);
	assign(archivoEmp, nomFisico);
	rewrite(archivoEmp);
	LeerEmpleado(e);
	while(e.apellido <> 'fin')do
	begin
		write(archivoEmp,e);
		LeerEmpleado(e);
	end;
	Close(archivoEmp);
end;
procedure empleadosEspecifico(var archivoE:archivo; nombre:cadena2);
var
	buscar:cadena1;
	e:Empleado;
begin
	writeln('Ingrese el Nombre o Apellido del Empleado a buscar: ');
	readln(buscar);
	reset(archivoE);
	while(not eof(archivoE))do
	begin
		read(archivoE,e);
		if(( e.apellido = buscar )or(e.nombre = buscar))then
		begin
				mostrar(e);
		end;
	end;
	Close(archivoE);
end;
procedure mostrarEmpleados(var archivoE:archivo; nombre:cadena2);
var 
	e:Empleado;
begin
	Assign(archivoE,nombre);
	reset(archivoE);
	while(not eof(archivoE))do
	begin
		read(archivoE,e);
		mostrar(e);
	end;
	Close(archivoE);
end;
procedure mayoresDe70Anios(var archivoE:archivo; nombre:cadena2);
var 
	edad:integer;
	e:Empleado;
	cant:integer;
begin
	cant:=0;
	edad:=70;
	writeln('mayores');
	assign(archivoE, nombre);
	reset(archivoE);
	while(not eof(archivoE))do
	begin
		read(archivoE,e);
		if(e.edad > edad)then
		begin
			cant:=cant + 1;
			mostrar(e);
		end;
	end;
	if(cant=0)then
	begin
		writeln('No Hay mayores de edad');
	end;
	Close(archivoE);
end;
procedure opcionDOS(var archivoE:archivo);
var 
	nombre:cadena2;
	opc:integer;
begin
	writeln();
	writeln('                                 SELECCIONE LA FORMA EN LA CUAL QUIERE VER LA INFORMACION                                   ');
	writeln();
	writeln('1. Listar empleados con Nombre o Apellido especificos');
	writeln('2. Listar todos los Empleados');
	writeln('3. Listar empleados mayores de 70 anios');
	readln(opc);
	writeln('Ingrese el nombre\path del Archivo');
	readln(nombre);
	
	case opc of
		1: empleadosEspecifico(archivoE,nombre);
		2: mostrarEmpleados(archivoE,nombre);
		3: mayoresDe70Anios(archivoE,nombre);
	end;
end;

var  
	archivoE:archivo;
	opc:integer;
begin
	writeln();
	writeln('                                            SELECCIONE UNA OPCION PARA CONTINUAR                                         ' );
	writeln	();
	writeln('1. Crear archivo e ingresar datos de empleados');
	writeln('2. Abrir el Archivo y Mostrar Infirmacion especificada ... ');
	readln(opc);
	case opc of
		1: opcionUNO(archivoE);
		2: opcionDOS(archivoE);
	end;
end.
