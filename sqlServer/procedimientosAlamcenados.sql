use pruebas;

drop table  procedimientoAlmacenado;

CREATE TABLE procedimientoAlmacenado
(
 codigo int identity,
 items numeric,
 isb VARCHAR(50),
 CONSTRAINT PK_codigoP PRIMARY KEY (codigo)
);


/*Numero randomico*/
SELECT (10 + CONVERT(INT, (30-10+1)*RAND())) AS NumeroAletorio;

/**Cadena aleatoria*/
SELECT CONCAT((CHAR(CAST((25)*RAND() + 63 as INT)) + CHAR(CAST((25)*RAND() + 62 as INT)) + CHAR(CAST((25 )*RAND() + 61 as INT))), (10 + CONVERT(INT, (30-10+1)*RAND()))) as CadenaAlfanumericaAleatoria;



DECLARE
  @i int, 
  @numero int,
  @alfanumerico varchar(50)
  SET @i = 1;
  SET @numero =0;
  SET @alfanumerico = ' ';
BEGIN TRAN
  WHILE @i< = 10
    BEGIN
    /**NUMERO ALFANUMERICO*/
    SELECT @numero = (@i + CONVERT(INT, (30-10+1)*RAND()));
    /** Alfanumerico*/
    SELECT 
    @alfanumerico =   CONCAT(
	    (CHAR(CAST((25)*RAND() + 63 as INT))
		 + CHAR(CAST((25)*RAND() + 62 as INT)) 
		 + CHAR(CAST((25 )*RAND() + 61 as INT))),
		  (10 + CONVERT(INT, (30-10+1)*RAND()))
	  );

	  INSERT INTO procedimientoAlmacenado ( items , isb) VALUES ( @numero, @alfanumerico);
	  SET @i=@i+1;
  END
COMMIT TRAN
GO

select * from procedimientoAlmacenado;
