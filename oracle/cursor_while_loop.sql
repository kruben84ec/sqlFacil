

/* Instruccion sql que presente en pantalla todos los datos de los empleados que ganan un salario 
superior al salario promedio de su departamento*/
--select * from emp f 
--where sal > (select avg(e.sal) from emp e where e.deptno=f.deptno )


declare 
  cursor c_sal_sup_prom_dept is
  
  select * from emp f 
  where sal > (select avg(e.sal) from emp e where e.deptno=f.deptno);

  mi_record c_sal_sup_prom_dept%ROWTYPE;
  
begin

  open c_sal_sup_prom_dept;
  
  FETCH c_sal_sup_prom_dept INTO mi_record;
  
  WHILE c_sal_sup_prom_dept%found
  LOOP 
        dbms_output.put_line('Empleado: ' || mi_record.ename || ' Trabajo: ' || mi_record.job || ' Salario: $' || TO_CHAR(mi_record.sal));
        FETCH c_sal_sup_prom_dept INTO mi_record;
  END LOOP; 
    
  close c_sal_sup_prom_dept;
  
end;