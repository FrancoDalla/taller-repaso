program actividad1;
type
	vector = array[1..10] of char;
	lista = ^nodo;
	nodo = record
		dato:char;
		sig:lista;
	end;
	
procedure armado_vector(var v:vector;pos:integer);
var
	caracter : char;
begin
	if(pos <= 10) then begin
		readln(caracter);
		v[pos] := caracter;
		if(caracter = '.') then 
			armado_vector(v,11)
		else
			armado_vector(v,pos + 1);
	end;
end;

procedure imprimir_vector_iterativo(v:vector);
var
	i : integer;
begin
	for i := 1 to 10 do begin
		write(v[i],' ');
	end;
end;

procedure imprimir_vector_recursivo(v:vector; pos:integer);
begin
	if(pos <= 10) then begin
		write(v[pos], ' ');
		imprimir_vector_recursivo(v, pos + 1);
	end;
end;

function lectura_retorno_cantidad():integer;
var
	caracter:char;
begin
	lectura_retorno_cantidad := 0;
	readln(caracter);
	if(caracter <> '.') then
		lectura_retorno_cantidad := lectura_retorno_cantidad + lectura_retorno_cantidad();
	lectura_retorno_cantidad := lectura_retorno_cantidad + 1;
end;

function armar_lista_recursiva():lista;

var
	v : vector;
begin
	armado_vector(v,1);
	imprimir_vector_recursivo(v,1);
	writeln(lectura_retorno_cantidad());
end.
