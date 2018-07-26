----------------SINTAXIS BASICA DE UN BUCLE WHILE----------------
DECLARE @counter INT
SET @counter = 1

WHILE @counter <= 10
	BEGIN
		PRINT @counter
		SET @counter = @counter + 1--controlamos el bucle	
	END
--------------USO DEL WHILE MAS UN CONTINIUE--------------------
DECLARE @CONTADOR INT
SET @CONTADOR = 10
WHILE (@CONTADOR >0)
 BEGIN
 	PRINT '@CONTADOR = ' + CONVERT(NVARCHAR,@CONTADOR)
 	SET @CONTADOR = @CONTADOR -1
 	IF (@CONTADOR = 5)
 		RETURN
 END
PRINT 'FIN'
--------------USO DEL WHILE MAS UN BREAKE-----------------------
DECLARE @contador int
    SET @contador = 0
    WHILE (1 = 1)
    BEGIN
     	SET @contador = @contador + 1
	IF (@contador % 10 = 0)
       	    BREAK
    	PRINT 'Iteracion del bucle ' + cast(@contador AS varchar)
    END 
--------------USO DE UN SELECT EN UN BULCE WHILE----------------
DECLARE @Contador NUMERIC (4)
DECLARE @MaxSalario NUMERIC (4)
DECLARE @Salario NUMERIC (4)

SET @Contador = (SELECT MIN (SAL) FROM EMP)
SET @MaxSalario = (SELECT MAX (SAL) FROM EMP)


WHILE @Contador <= @MaxSalario
	BEGIN
		SET @Salario = (SELECT COUNT(*) FROM EMP WHERE SAL =  @Contador)
		PRINT CAST (@Salario AS VARCHAR (10)) + '---EMPLEADOS QUE GANAN---' + 
		CAST (@counter AS VARCHAR (10)) + '---DOLARES---'

		SET @Contador = @Contador+ 25	
	END

--------------USO DE UN WHILE MAS UN IF-----------------
DECLARE @Contador NUMERIC (4)
DECLARE @MaxSalario NUMERIC (4)
DECLARE @Salario NUMERIC (4)

SET @Contador = (SELECT MIN (SAL) FROM EMP)
SET @MaxSalario = (SELECT MAX (SAL) FROM EMP)


WHILE @Contador <= @MaxSalario
	BEGIN
		SET @Salario = (SELECT COUNT(*) FROM EMP WHERE SAL =  @Contador)

		IF @Salario != 0

		PRINT CAST (@Salario AS VARCHAR (10)) + '---EMPLEADOS QUE GANAN---' + 
		CAST (@Contador AS VARCHAR (10)) + '---DOLARES---'

		SET @Contador = @Contador+ 25	;
	END
--------------------------USO DE UN WHILE CON CURSORES---------------------------------
DECLARE @NUM NUMERIC(4)
DECLARE @NAME VARCHAR(10)

DECLARE EMPCURSOR CURSOR FOR 
	SELECT EMPNO, ENAME FROM EMP;

OPEN EMPCURSOR

FETCH NEXT FROM EMPCURSOR INTO @NUM, @NAME

WHILE @@FETCH_STATUS = 0 --analiza que existan datos en el cursos, es decir que todavia tenga que leer
	BEGIN 
		PRINT '---NOMBRE DEL EMPLEADO---' + @NAME

		SELECT SAL FROM EMP WHERE EMPNO = @NUM

		FETCH NEXT FROM EMPCURSOR INTO @NUM, @NAME--sentencia de control de bucle
	END

CLOSE EMPCURSOR
DEALLOCATE EMPCURSOR