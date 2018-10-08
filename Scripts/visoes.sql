--Essa visão auxilia na recuperação do produto mais comprado a fornecedores.
CREATE VIEW pedidosVisao
AS(
    SELECT P.Nome, COUNT(*) AS Pedidos
    FROM CompraProduto CP, Produto P
    WHERE CP.CodProduto = P.Codigo
    GROUP BY CP.CodProduto, P.Nome
);

--Essa visão auxilia na recuperação do tamanho de roupa mais vendido a clientes.

CREATE VIEW tamanhosVisao
AS(
    SELECT P.Tamanho, COUNT(*) AS Vendidos
    FROM VendaProduto VP, Produto P
    WHERE VP.CodProduto = P.Codigo
    GROUP BY P.Tamanho
);

-- Essa visão auxilia na recuperação do fornecedor que o estabelecimento compra mais
CREATE VIEW fornecedoresVisao
AS(
    SELECT F.CNPJ, F.NOME, COUNT(*) AS Pedidos
    FROM Fornecedor F, Compra C
    WHERE F.CNPJ = C.Fornecedor
    GROUP BY F.CNPJ, F.Nome
);

--Essa visão auxilia na recuperação do vendedor que atende em mais vendas.
CREATE VIEW vendedorVisao
AS(
    SELECT F.CPFPessoa, P.Nome, COUNT(*) AS Vendas
    FROM Funcionario F, Venda V, Pessoa P
    WHERE F.CPFPessoa = V.Funcionario AND F.Cargo = 'Vendedor' AND F.CPFPessoa = P.CPF
    GROUP BY F.CPFPessoa, P.Nome
);
 
-- Essa visão auxilia na recuperação de vendas por funcionário.

CREATE VIEW vendasVisao
AS(
    SELECT V.Funcionario, VP.CodProduto, VP.Quantidade
    FROM Venda V NATURAL JOIN VendaProduto VP
 );