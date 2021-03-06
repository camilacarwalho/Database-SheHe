﻿
-- Recuperar e-mail dos clientes atendidos por Milena.

	SELECT C.email
	FROM Cliente C JOIN Venda V ON C.CPFPessoa = V.Cliente
	WHERE  V.Funcionario = '358.947.104-21'

--Recuperar nome dos clientes que usaram cartão da Visa.

	SELECT P.Nome
	FROM CartaoCredito CC, VendaCartao VC, Venda V, Cliente C, Pessoa P
	WHERE CC.Numero = VC.NumCartao AND V.CodVenda = VC.CodVenda AND V.Cliente 	= C.CPFPessoa AND C.CPFPessoa = P.CPF

--Recuperar telefone de todos os fornecedores que venderam acima de 20 produtos para a loja.

	SELECT F.CNPJ, F.Telefone
	FROM (Compra C NATURAL JOIN CompraProduto CP) JOIN Fornecedor F ON C.Fornecedor = F.CNPJ
	GROUP BY F.CNPJ, F.Telefone, CP.Quantidade
	HAVING CP.Quantidade > 20

--Recuperar o nome de clientes que pagaram com cartão em pelo menos duas parcelas.

	select p.nome 
	from pessoa p
	where p.cpf in
		(select c.cpfpessoa
		from (VendaCartao VC NATURAL JOIN Venda V) JOIN Cliente C ON V.Cliente = C.CPFPessoa
		WHERE VC.NumParcelas >= 2)


--Recuperar nome de todos os clientes já forneceram seu e-mail

	SELECT P.Nome AS NomeCliente
	FROM Cliente C JOIN Pessoa P ON C.CPFPessoa = P.CPF
	WHERE C.email IS NOT NULL

--Recuperar  o cpf de funcionários que nunca atenderam nenhuma venda

	SELECT F.CPFPessoa
	FROM Funcionario F LEFT JOIN Venda V ON F.CPFPessoa = V.Funcionario
	WHERE V.CodVenda IS NULL


-- Recuperar nome de todos os funcionários que começam com a letra M.

	SELECT P.Nome
	FROM Funcionario F JOIN Pessoa P ON F.CPFPessoa = P.CPF
	WHERE P.Nome LIKE 'M%'

--Recuperar email de clientes que usam o domínio @hotmail.com

	SELECT email
	FROM cliente
	WHERE email LIKE '%@hotmail.com'


-- Recuperar nome e endereço de funcionários que moram na cidade de Cajazeiras.

	SELECT P.Nome, F.Rua, F.Bairro
	FROM Funcionario F JOIN Pessoa P ON F.CPFPessoa = P.CPF
	WHERE F.Cidade = 'Cajazeiras'
	ORDER BY P.Nome

-- Verificar quais produtos estão disponíveis na loja.
	
	SELECT codigo, Nome
	FROM Produto
	WHERE Status = 'Disponível'
	ORDER BY Nome

--Recuperar valor de cada produto disponível se a loja toda declarar desconto de 20%.
	
	SELECT Nome, PrecoVenda * 0.80 AS PreçoDesconto
	FROM Produto
	ORDER BY Nome


-- Recuperar e-mail e nome de todos os clientes que fizeram mais de uma compra.

	SELECT C.email, P.Nome
	FROM Cliente C JOIN Pessoa p ON P.CPF=C.CPFpessoa
	WHERE C.CPFpessoa IN
	(SELECT V.Cliente
	FROM Venda V, Cliente C
	WHERE V.Cliente = C.CPFPessoa
	GROUP BY V.Cliente
	HAVING Count(*)>1)

-- Recuperar nome e código de produtos que tiveram pelo menos 2 vendas contabilizadas.

	SELECT P.Nome, P.Codigo
	FROM Produto P 
	WHERE P.Codigo  IN
	(SELECT VP.CodProduto
	FROM VendaProduto VP
	GROUP BY VP.CodProduto
	HAVING Count(*)>=2 AND VP.CodProduto = P.Codigo)


--Recuperar nome de funcionários que ainda não receberam pagamento

	SELECT P.Nome
	FROM Pessoa P JOIN Funcionario F ON P.CPF = F.CPFPessoa
	WHERE NOT EXISTS
	(SELECT * FROM Pagamento PA
	 WHERE P.CPF = PA.Funcionario)

--Recuperar email de clientes atendidos por funcionários efetivos

	SELECT c.email
	FROM Cliente C
	WHERE EXISTS
	(SELECT * 
	 FROM Venda V JOIN Funcionario F ON V.Funcionario = F.CPFPessoa
	 WHERE F.Status = 'Efetivo')

--Recuperar produtos disponíveis tanto em tamanho P quanto em tamanho G

	(SELECT Nome
	FROM Produto
	WHERE Status = 'Disponível' AND Tamanho = 'P')
	INTERSECT
	(SELECT Nome
	FROM Produto
	WHERE Status = 'Disponível' AND Tamanho = 'G')

--Recuperar código de despesas que não provém de compras

	(SELECT CodDespesa
	FROM Despesa)
	EXCEPT
	(SELECT CodDespesa
	FROM Despesa NATURAL JOIN Compra)


-- Verificar o lucro de vendas entre 2018-08-11 até 2018-08-20.

	SELECT SUM(Valor) as Lucro
	FROM  Entrada
	WHERE Data >= '2018-08-11' AND Data <= '2018-08-20'

-- Verificar o prejuízo com despesas entre 2018-07-30 e 2018-08-30

	SELECT SUM(Valor) as Prejuíjo
	FROM Despesa
	WHERE Data >= '2018-07-30' AND Data <= '2018-08-30'


-- Verificar quantos produtos estão disponíveis na loja.

	SELECT COUNT(*) AS Disponíveis
	FROM Produto
	GROUP BY Status 
	HAVING Status = 'Disponível'

-- Verificar quantas vendas cada funcionário realizou

	SELECT V.Funcionario, P.Nome, COUNT(*) AS Vendas
	FROM (Venda V JOIN Funcionario F ON V.Funcionario = F.CPFPessoa) JOIN Pessoa P ON P.CPF = F.CPFPessoa
	GROUP BY V.Funcionario, P.Nome
