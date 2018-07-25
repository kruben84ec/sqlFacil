
--instruccion sql que presente en pantalla todos los datos de los empleados que ganan el maximo salario 
--en cada uno de sus departamentos
--select * from emp f 
--  where sal in(select max(sal) from emp e where e.deptno=f.deptno)

--bucle FOR LOOP. Es la forma más corta ya que implicitamente se ejecutan las instrucciones OPEN, FECTH y CLOSE.

DECLARE

CURSOR cursor_1 IS
select * from emp f 
where sal in (select max(sal) from emp e where e.deptno=f.deptno);

w_registro cursor_1%ROWTYPE;
total_val number(7,2);
nom_dept varchar2(14 BYTE);

BEGIN

   total_val := 0;

   FOR w_registro in cursor_1
   LOOP
      total_val := total_val + w_registro.sal;
      dbms_output.put('Empleado: ' || w_registro.ename || ' Trabajo: ' || w_registro.job || ' Salario: $' || TO_CHAR(w_registro.sal));
      select dept.dname into nom_dept from dept where dept.deptno=w_registro.DEPTNO;
      dbms_output.put_line(' Departamento: '||nom_dept);
      dbms_output.put_line('');
   END LOOP;
   
   dbms_output.put_line('Suma de los maximos salarios de cada departamento = $' || TO_CHAR(total_val));

END;
