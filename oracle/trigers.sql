
insert into libros values (150,'El gato con botas','Anonimo','Emece',21);
  
select *from control;

/**
La sentencia disparadora fue una inserción, por lo tanto, 
los campos ":old.codigo" y ":old.precio" contienen "null", 
así que en "codigo" y en "precioanterior" se almacena "null";
el único campo con valor diferente de "null" es "precionuevo" 
correspondiente al valor de ":new.precio".

*/
   
update libros set precio=12 where codigo=103;
    
select *from control;
   
update libros set autor='J.L.Borges' where autor='Borges';
    
select *from control;
     
delete from libros where codigo=100;

      
select *from control;

/**
Veamos qué informa el diccionario "user_triggers" respecto del trigger anteriormente creado:
*/
select * from user_triggers where trigger_name ='TR_LIBROS';

/**
tomado de: http://www.tutorialesprogramacionya.com/oracleya/simulador/simulador.php?cod=270
*/