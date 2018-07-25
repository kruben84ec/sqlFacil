--añadir _EEUU a la ubicacion del departamento

DECLARE

  CURSOR c_cursor IS
  
  select loc from dept
  FOR UPDATE;
  
  locacion dept.loc%type;
  
BEGIN

  OPEN c_cursor;
  
  FETCH c_cursor INTO locacion;
  
  WHILE c_cursor%found
    LOOP
      UPDATE DEPT SET LOC = locacion || '_EEUU'
      WHERE CURRENT OF c_cursor;
      
      FETCH c_cursor INTO locacion;
    END LOOP;
  
  CLOSE c_cursor;
  
  --ROLLBACK;
  COMMIT;
  
END;





----------------------------------------------------------------------------
/*
select * from dept;

UPDATE DEPT SET LOC = 'NEW YORK' WHERE DEPTNO=10;
UPDATE DEPT SET LOC = 'DALLAS' WHERE DEPTNO=20;
UPDATE DEPT SET LOC = 'CHICAGO' WHERE DEPTNO=30;
UPDATE DEPT SET LOC = 'BOSTON' WHERE DEPTNO=40;
COMMIT;
ROLLBACK;
*/