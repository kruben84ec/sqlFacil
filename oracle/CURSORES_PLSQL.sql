set serveroutput on;

--CURSORES IMPLICITOS
DECLARE 
    CIUDAD1 VARCHAR2(13);
BEGIN 
    SELECT LOC
    INTO CIUDAD1 
    FROM DEPT
    WHERE DEPTNO = 30;
    DBMS_OUTPUT.PUT_LINE('EL CURSOR APUNTA A: ' || CIUDAD1);
END;

SELECT * FROM DEPT;

--CURSORES EXPLICITOS

--EJERCICIO DE EJEMPLO (LOOP)

--Instruccion SQL que presente en pantalla todos los datos de los empleados del
--departamento 10 y 30 y contar la cantidad de SALESMAN.

--CONSULTA

SELECT * FROM EMP
WHERE DEPTNO=10
UNION 
SELECT * FROM EMP
WHERE DEPTNO=30;

SELECT * FROM EMP
WHERE DEPTNO IN (10,30);

DECLARE 
	cursor c_cursor is
	SELECT * FROM EMP
    WHERE DEPTNO IN (10,30);

	codigo emp.EMPNO%TYPE;
	nombre emp.ENAME%TYPE;
	trabajo emp.JOB%TYPE;
	mng emp.MGR%TYPE;
	fechaC emp.HIREDATE%TYPE; 
	salario emp.SAL%TYPE;
	comm emp.COMM%TYPE;
	codDep emp.DEPTNO%TYPE;
	cont number(4);
 
BEGIN
	open c_cursor;

	cont := 0;
  
	LOOP 

        FETCH c_cursor INTO codigo, nombre, trabajo, mng, fechaC, salario, comm, codDep;
        EXIT WHEN c_cursor%NOTFOUND;    
        dbms_output.put_line('Codigo: ' || TO_CHAR(codigo) || ' Empleado: ' || nombre || ' Trabajo: ' || trabajo);
        
	IF (trabajo = 'SALESMAN') THEN
          cont := cont + 1;
        END IF;
	
	END LOOP; 
    
	close c_cursor;
	dbms_output.put_line(' ');
	dbms_output.put_line('La cantidad de vendedores es: ' || TO_CHAR(cont));
END;

--EJERCICIO DE EJEMPLO (WHILE)

--Presentar en pantalla todos los empleados con salario superior a 1500 

--CONSULTA
    select * from emp
    where sal > 1500;

DECLARE 
CURSOR cur1 IS
    select * from emp
    where sal > 1500; 
var_emple cur1%ROWTYPE;

BEGIN 
    OPEN cur1;
    FETCH cur1 INTO var_emple;
    WHILE cur1%FOUND LOOP
    DBMS_OUTPUT.PUT_lINE('El EMPLEADO ' || var_emple.ENAME || ' CON ID ' ||
    var_emple.empno || ' TIENE UN SALARIO ' || var_emple.sal);
    FETCH cur1 INTO var_emple;
    END LOOP;
    CLOSE cur1;
END;

--EJERCICIO DE EJEMPLO (FOR)

--Instrucción sql que presente en pantalla todos los datos de los empleados 
--que ganan el maximo salario en cada uno de sus departamentos

--CONSULTA

select * from emp f 
where sal in (	select max(sal) from emp e 
		where e.deptno=f.deptno)

--El bucle FOR LOOP. Es la forma más corta ya que 
--implicitamente se ejecutan las instrucciones OPEN, 
--FECTH y CLOSE.

DECLARE
	CURSOR cursor_1 IS
	select * from emp f 
	where sal in (	select max(sal) from emp e 
			where e.deptno=f.deptno);

	w_registro cursor_1%ROWTYPE;
	total_val number(7,2);
	nom_dept varchar2(14 BYTE);
BEGIN
  total_val := 0;

	FOR w_registro in cursor_1 LOOP

  total_val := total_val + w_registro.sal;
  dbms_output.put('Empleado: ' || w_registro.ename || ' Trabajo: ' || w_registro.job || ' Salario: $' || TO_CHAR(w_registro.sal));
      	
	select dept.dname into nom_dept from dept 
	where dept.deptno = w_registro.DEPTNO;
	
	dbms_output.put_line(' Departamento: '||nom_dept);
	dbms_output.put_line('');

	END LOOP;
   
  dbms_output.put_line('Suma de los maximos salarios de cada departamento = $' || TO_CHAR(total_val));
END;

--EJERCICIO DE EJEMPLO (UPDATE)

--Añadir "_EEUU" a la ubicacion del departamento

DECLARE
    CURSOR c_cursor IS
    select loc from dept
    FOR UPDATE;
    locacion dept.loc%type;
BEGIN
    OPEN c_cursor;
    FETCH c_cursor INTO locacion;
  
    WHILE c_cursor%found LOOP
      UPDATE DEPT SET LOC = locacion || '_EEUU'
      WHERE CURRENT OF c_cursor;
      
      FETCH c_cursor INTO locacion;
      
    END LOOP;
  
    CLOSE c_cursor;
    --ROLLBACK; 
    COMMIT;
END;

select * from dept;

--EJERCICIO DE EJEMPLO (CURSORES PARAMETRIZADOS)

DECLARE
  CURSOR c_cursor (num dept.deptno%TYPE) IS 
  
  SELECT * FROM dept 
  WHERE dept.deptno = num;
  
  registro dept%ROWTYPE;
  
BEGIN
  OPEN c_cursor(20);
  LOOP
    FETCH c_cursor INTO registro;
    EXIT WHEN c_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE ('Codigo: '||TO_CHAR(registro.deptno)|| ' Departamento: ' || registro.dname || ' Ubicacion: '||registro.loc);
  END LOOP;
  CLOSE c_cursor;

  OPEN c_cursor(40);
  LOOP
    FETCH c_cursor INTO registro;
    EXIT WHEN c_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE ('Codigo: '||TO_CHAR(registro.deptno)|| ' Departamento: ' || registro.dname || ' Ubicacion: '||registro.loc);
  END LOOP;
  CLOSE c_cursor;  
END;