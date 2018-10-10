	
-- Esse procedimento armazenado classifica o salário de cada funcionário.

CREATE OR REPLACE FUNCTION ClassificaSalario (VARCHAR(20)) RETURNS VARCHAR
	AS $$
		DECLARE
			SalFun funcionario.SALARIO%TYPE;
			CPFFun ALIAS FOR $1;
	BEGIN
			SELECT INTO SalFun SALARIO FROM Funcionario WHERE CPFFunc = CPFPessoa;
			IF SalFun < 1000 THEN RETURN 'Salário baixo',
				ELSE IF SalFunc<2000 THEN RETURN 'Salário Médio',	
				ELSE RETURN 'Salário Alto';
				END IF;
		END IF;
END
$$ LANGUAGE PLPGSQL;

-- Esse procedimento armazenado retorna os dias entre duas datas
CREATE OR REPLACE FUNCTION DiasEntre(DATE, DATE) RETURNS INTEGER
	AS $$
		DECLARE
			MaiorData DATE;
			MenorData DATE;
			quantDias INTEGER;
		BEGIN
			IF ($1<$2) THEN
				MenorData := $1;
				MaiorData := $2;
			ELSE
				MenorData := $2;
				MaiorData := $1;
			END IF;
			quantDias := MaiorData - MenorData; 
			RETURN quantDias;
		END;
	$$ LANGUAGE PLPGSQL;
