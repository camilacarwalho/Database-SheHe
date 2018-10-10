--Esse gatilho garante que os salários dos funcionários não podem ser atualizados para um valor menor que o atual: 

CREATE FUNCTION VerificaSalario () RETURNS TRIGGER
	AS $$
		BEGIN
			IF(NEW.salario < OLD.salario) THEN RETURN NULL;
				ELSE RETURN NEW;
			END IF;
		END
	$$ LANGUAGE PLPGSQL;

CREATE TRIGGER VerificaSalarioTrigger BEFORE UPDATE ON Funcionario
	FOR EACH ROW
	EXECUTE PROCEDURE VerificaSalario();



-- Fazer um gatilho para garantir que nenhum funcionário ainda não efetivo tenha seus dados atualizados
CREATE FUNCTION VerificaFuncionarioNaoEfetivo () RETURNS TRIGGER
	AS $$
		BEGIN
			IF((NEW.status = 'Não efetivo')AND(OLD.status = 'Não efetivo')) THEN RETURN NULL;
				ELSE RETURN NEW;
			END IF;
		END
	$$ LANGUAGE PLPGSQL;
	
CREATE TRIGGER VerificaFuncionarioNaoEfetivo BEFORE UPDATE ON Funcionario
	FOR EACH ROW
	EXECUTE PROCEDURE VerificaFuncionarioNaoEfetivo());	