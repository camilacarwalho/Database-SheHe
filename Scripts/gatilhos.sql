--Esse gatilho garante que os salários dos funcionários não podem ser atualizados para um valor menor que o atual: 

CREATE FUNCTION VerificaSalario () RETURNS TRIGGER
	AS $$
		BEGIN
			IF(NEW.salario < OLD.salario) THEN RETURN NULL;
				ELSE RETURN NEW;
			END IF;
		END
	$$ LANGUAGE PLPGSQL;

CREATE TIGGER VerificaSalarioTrigger BEFORE UPDATE ON Funcionario
	FOR EACH ROW
	EXECUTE PROCEDURE VerificaSalario();



-- Fazer um gatilho para garantir que nenhum funcionário receba mais de um pagamento no mesmo dia.