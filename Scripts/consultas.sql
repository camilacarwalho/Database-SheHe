--Duas Junções OK
-- Recuperar e-mail dos clientes atendidos por Milena.

	SELECT C.e-mail
	FROM Cliente C JOIN Venda V ON C.CPFPessoa = V.Cliente
	WHERE  V.Funcionario = ‘Milena’

--Recuperar nome dos clientes que usaram cartão da Visa.

	SELECT P.Nome
	FROM CartaoCredito CC, VendaCartao VC, Venda V, Cliente C, Pessoa P
	WHERE CC.Numero = VC.NumCartao AND V.CodVenda = VC.CodVenda AND V.Cliente 	= C.CPFPessoa AND C.CPFPessoa = P.CPF

--Recuperar telefone de todos os fornecedores que venderam acima de 10 produtos para a loja.

	SELECT Telefone
	FROM Compra C JOIN Fornecedor F ON F.CNPJ = C.Fornecedor
	WHERE C.Quantidade > 10

--Recuperar o nome de clientes que pagaram com cartão em pelo menos duas parcelas.

	SELECT C.Nome
	FROM VendaCartao VC, Venda V, Cliente C
	WHERE VC.CodVenda = V.CodVenda AND V.Cliente = C.CPFPessoa AND VC.NumParcelas >= 2


--Duas comparações com valores nulos OK

--Recuperar nome de todos os clientes que ainda não forneceram seu e-mail
	SELECT P.Nome AS NomeCliente
	FROM Cliente C JOIN Pessoa P ON C.CPFPessoa = P.CPF
	WHERE C.email IS NOT NULL
--Recuperar funcionários que nunca atenderam nenhuma venda
	SELECT F.CPFPessoa
	FROM Funcionario F LEFT JOIN Venda V ON F.CPFPessoa = V.Funcionario
	WHERE V.CodVenda IS NULL

--Duas buscas por substrings 

-- Recuperar nome de todos os funcionários que começam com a letra T.

	SELECT Nome
	FROM Funcionario
	WHERE Nome LIKE ‘T%’

--Recuperar email de clientes que usam o domínio @gmail.com
	SELECT Email
--Duas buscas com ordenação OK

-- Recuperar nome e endereço de funcionários que moram na cidade de Cajazeiras.
	SELECT P.Nome, F.Rua, F.Bairro
	FROM Funcionario F JOIN Pessoa P ON F.CPFPessoa = P.CPF
	WHERE F.Cidade = ‘Cajazeiras’
	ORDER BY P.Nome

-- Verificar quais produtos estão disponíveis na loja.
	
	SELECT CodProduto, Nome
	FROM Produto
	WHERE Status = ‘Disponível’
	ORDER BY Nome

--Recuperar valor de cada produto disponívelse a loja toda declarar desconto de 20%.
	
	SELECT Nome, PreçoVenda * 0.80 AS PreçoDesconto
	FROM Produto
	ORDER BY Nome

--Duas consultas aninhadas OK
-- Recuperar e-mail e nome de todos os clientes que fizeram mais de uma compra.

	SELECT C.email, P.Nome
	FROM Cliente C JOIN Pessoa p ON P.CPF=C.CPFpessoa
	WHERE C.CPFpessoa IN
	(SELECT V.Cliente
	FROM Venda V, Cliente C
	WHERE V.Cliente = C.CPFPessoa
	GROUP BY V.Cliente
	HAVING Count(*)>1)

-- Recuperar nome e código de produtos que tiveram pelo menos 4 vendas contabilizadas.

	SELECT P.Nome, P.Codigo
	FROM Produto P 
	WHERE P.Codigo  IN
	(SELECT VP.CodProduto
	FROM VendaProduto VP
	GROUP BY VP.CodProduto
	HAVING Count(*)>=4 AND VP.CodProduto = P.Codigo)

--Duas consultas aninhadas correlacionadas AINDA N

--Duas consultas com operações de conjunto AINDA N

--Duas consultas com funções agregadas FALTA 1
-- Verificar o lucro de vendas entre 2018-08-11 até 2018-08-20.

	SELECT SUM(Valor) as Lucro
	FROM  Entrada
	WHERE Data >= ‘2018-08-11’ AND Data <= ‘2018-08-20’



--Duas consultas com agrupamento, uma com filtragem de grúpo FALTA 1
-- Verificar quantos produtos estão disponíveis na loja.

	SELECT COUNT(*) AS Disponíveis
	FROM Produto
	GROUP BY Status 
	HAVING Status = ‘Disponível’
