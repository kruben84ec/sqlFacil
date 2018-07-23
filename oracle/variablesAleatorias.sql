/*Numero randomico*/
select MOD(Round(DBMS_RANDOM.Value(1, 99)), 9) + 1 AS randomico from CONTROL;

/*Alfanumerico**/
select DBMS_RANDOM.STRING('x', 10) from dual;

/**Creacion de la tabla*/

create table procedimientoRandomico(
  codigo number(6),
  titulo varchar2(40),
  isb varchar2(30)
 );
 
 
 
 INSERT INTO PROCEDIMIENTORANDOMICO values ( 1,MOD(Round(DBMS_RANDOM.Value(1, 99)), 9) + 1,  DBMS_RANDOM.STRING('x', 10));
 
 
   DECLARE
    limite NUMBER;
  BEGIN
    limite := 100;
    FOR i IN 1..limite
    LOOP
    INSERT INTO PROCEDIMIENTORANDOMICO VALUES 
    ( i,MOD(Round(DBMS_RANDOM.Value(1, i)), 9) + 1,  DBMS_RANDOM.STRING('x', 10));
    END LOOP;
  END;
 
 
 
 
 select * from PROCEDIMIENTORANDOMICO;