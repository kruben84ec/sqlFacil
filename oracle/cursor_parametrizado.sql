--select * from dept;

DECLARE

  CURSOR c_cursor (num dept.deptno%TYPE) IS 
  
  SELECT * FROM dept WHERE dept.deptno = num;
  
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