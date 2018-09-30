-- Esse procedimento armazenado calcula quantidade de vendas de produto que cada funcionário atendeu.
CREATE OR REPLACE FUNCTION SomaVendaProduto (VARCHAR(20)) RETURNS INTEGER
AS $$
	DECLARE
	    CPF ALIAS FOR $1;
	    soma INTEGER;
	    CP VendasVisao%ROWTYPE;
	BEGIN
	    soma:=0;
	    FOR VP IN SELECT * FROM VendasVisao WHERE V.Funcionario = CPF
		LOOP
			soma := soma+VP.quantidade;
		END LOOP;
		RETURN soma;
	END
$$ LANGUAGE PLPGSQL
		
-- Esse procedimento armazenado classifica o salário de cada funcionário.

CREATE OR REPLACE FUNCTION ClassificaSalario (VARCHAR(20)) RETURNS VARCHAR
AS $$
	DECLARE
		SalFun Funcionario.SALARIO%TYPE;
		CPFFun ALIAS FOR $1;
	BEGIN
		SELECT INTO SalFun SALARIO FROM Funcionario WHERE CPFFunc = 		CPFPessoa;
		IF SalFun < 1000 THEN RETURN 'Salário baixo',
			ELSE IF SalFunc<2000 THEN RETURN 'Salário Médio',	
				ELSE RETURN 'Salário Alto';
			END IF;
		END IF;
END
$$ LANGUAGE PLPGSQL		