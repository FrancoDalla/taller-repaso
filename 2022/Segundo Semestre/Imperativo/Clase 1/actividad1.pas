program hola;
type
	venta = record
		codigo : integer;
		cantidad_vendida : integer;
	end;
	ventas = array[1..20] of venta;
	lista_tipo = ^nodo;
	nodo = record
		dato : venta;
		sig : lista_tipo;
	end;
procedure leer_venta(var venta_aux:venta);
begin
	with venta_aux do begin
		codigo := random(16);
		if(codigo <> 0) then begin
			cantidad_vendida := random(99)+1;
		end;
	end;
end;
procedure ordenar_vector(var v:ventas; leidas: integer);
var
	aux_pos, i, j: integer;
	venta_aux : venta;
begin
	for i := 1 to leidas - 1  do begin
		aux_pos := i;
		for j := i + 1  to leidas do begin
			if (v[j].codigo < v[aux_pos].codigo) then begin
				aux_pos := j;
			end;
		end;
		venta_aux := v[aux_pos];
		v[aux_pos] := v[i];
		v[i] := venta_aux;
	end;	
end;
procedure imprimir_vector(var vector_ventas:ventas; leidas:integer);
var
	i:integer;
begin
	for i := 1 to leidas do begin
		write ('#', i);
		write(' codigo: ', vector_ventas[i].codigo);
		write(' ventas: ', vector_ventas[i].cantidad_vendida);
		writeln();
	end;
end;
procedure eliminar_rango(var v:ventas; leidas,desde,hasta:integer);
var
	i, j, pos_desde,pos_hasta:integer;
	venta_nula : venta;
begin
	venta_nula. codigo := 0;
	venta_nula.cantidad_vendida := -1;
	pos_desde := -1; pos_hasta := -1; i := 1;
	while(((pos_desde = -1) or (pos_hasta = -1)) and (i <= leidas)) do begin
		if(v[i].codigo = desde) then begin
			pos_desde := i;
		end
		else begin
			if(v[i].codigo = hasta) then begin
				pos_hasta := i;
			end;
		end;
		i := i + 1;
	end;
	if(pos_hasta = -1 ) then begin
		pos_hasta := leidas;
	end
	else begin
		if(pos_hasta <> leidas) then begin
			j := pos_hasta +1;
		end;
	end;
	writeln('posicion desde: ', pos_desde, ' posicion hasta: ', pos_hasta);
	for i := pos_desde to pos_hasta do begin
		if(j <= leidas) then begin
			v[i] := v[j];
			j := j +1;
		end
		else begin
			v[i] := venta_nula;
		end;
	end;		
end;
procedure insertar_detras(var l, ult:lista_tipo; dato:venta);
var 
	aux : lista_tipo;
begin
	new(aux);
	aux^.dato := dato;
	aux^.sig := nil;
	if(l = nil) then begin
		l := aux;
	end
	else begin
		ult^.sig := aux;
	end;
	ult := aux;
end;
procedure armar_lista(v:ventas; leidas: integer;var lista:lista_tipo);
var
	i : integer;
	ult : lista_tipo;
begin
	lista := nil; ult := nil;
	for i := 1 to leidas do begin
		if(v[i].codigo MOD 2 = 0) then begin
			writeln('se agrego elemento');
			insertar_detras(lista, ult, v[i]);
		end;
	end;
end;
procedure imprimir_lista(l:lista_tipo);
begin
	while(l <> nil) do begin
		writeln('codigo venta: ', l^.dato.codigo, ' vendidos: ',l^.dato.cantidad_vendida);
		l := l^.sig;
	end;
end;
var
	venta_aux : venta;
	leidas : integer;
	vector_ventas : ventas;
	lista:lista_tipo;
begin
	Randomize();
	leidas := 0;
	leer_venta(venta_aux);
	while((venta_aux.codigo <> 0) and (leidas <> 20)) do begin
		leidas := leidas + 1;
		vector_ventas[leidas] := venta_aux;
		if(leidas < 20) then 
			leer_venta(venta_aux);
	end;
	writeln('IMPRESION DESORDENADA');
	imprimir_vector(vector_ventas, leidas);
	writeln('IMPRESION ORDENADA');
	ordenar_vector(vector_ventas,leidas);
	imprimir_vector(vector_ventas, leidas);
	{eliminar_rango(vector_ventas, leidas, 12,10);
	writeln('IMPRESION TRAS ELIMINACION');
	imprimir_vector(vector_ventas,leidas);}
	armar_lista(vector_ventas, leidas, lista);
	writeln('IMPRESION LISTA');
	imprimir_lista(lista);
end.
