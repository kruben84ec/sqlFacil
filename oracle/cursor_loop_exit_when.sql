--INSTRUCCION SQL QUE PRESENTE EN PANTALLA TODOS LOS DATOS 
--DEL EMP DEL DEP 10 MAS TODOS LOS DATOS DEL EMP DEL DEPARTAMENTO 30 Y CONTAR LA CANTIDAD DE ""VENDEDORES"
--SELECT * FROM EMP
--WHERE DEPTNO=10
--UNION 
--SELECT * FROM EMP
--WHERE DEPTNO=30;


declare 
  cursor c_cursor is

  SELECT * FROM EMP
  WHERE DEPTNO=10
  UNION 
  SELECT * FROM EMP
  WHERE DEPTNO=30;
  
  codigo emp.EMPNO%TYPE;
  nombre emp.ENAME%TYPE;
  trabajo emp.JOB%TYPE;
  mng emp.MGR%TYPE;
  fechaC emp.HIREDATE%TYPE; 
  salario emp.SAL%TYPE;
  comm emp.COMM%TYPE;
  codDep emp.DEPTNO%TYPE;
  cont number(4);
  
  begin

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
  
  dbms_output.put_line('La cantidad de vendedores es: ' || TO_CHAR(cont));
  
  end;