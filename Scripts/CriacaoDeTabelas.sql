-- Criando relação Pessoa
CREATE TABLE Pessoa(
	cpf VARCHAR(20),
	nome VARCHAR(100) NOT NULL,
	telefone VARCHAR(20) NOT NULL,
	CONSTRAINT PKPessoa PRIMARY KEY(cpf)
	);
--Criando a relação Funcionario
	CREATE TABLE Funcionario(
	cpfPessoa VARCHAR(20),
	cargo VARCHAR(20) NOT NULL,
	dataAdmissao DATE NOT NULL,
	salario REAL NOT NULL,
	status VARCHAR(20) NOT NULL,
	bairro VARCHAR(100) NOT NULL,	
	rua VARCHAR(100) NOT NULL,
	cidade VARCHAR(100) NOT NULL,
	CONSTRAINT SalarioPositivo CHECK(salario>0),
	CONSTRAINT PKFuncionario PRIMARY KEY (cpfPessoa),
	CONSTRAINT FKFuncionario FOREIGN KEY (cpfPessoa) REFERENCES Pessoa(CPF)
	);

--Criando a relação Cliente
	CREATE TABLE Cliente(
	CPFPessoa VARCHAR(20),
	email VARCHAR(100) UNIQUE,
	CONSTRAINT PKCliente PRIMARY KEY(CPFPessoa),
	CONSTRAINT FKCliente FOREIGN KEY(CPFPessoa) REFERENCES Pessoa(CPF)
	);

--Criando a relação Despesa
	CREATE TABLE Despesa(
	CodDespesa INT,
	Valor REAL NOT NULL,
	Data DATE NOT NULL,
	CONSTRAINT PKDespesa PRIMARY KEY(CodDespesa),
	CONSTRAINT DespPositiva CHECK(Valor>0)
	);

--Criando a relação Pagamento
	CREATE TABLE Pagamento(
	CodPagamento INT,
    Funcionario VARCHAR(20) NOT NULL,
	Hora TIME NOT NULL,
	CodDespesa INT NOT NULL,
	CONSTRAINT PKPagamento PRIMARY KEY(CodPagamento),
	CONSTRAINT FK1Pagamento FOREIGN KEY(CodDespesa) REFERENCES 	Despesa(CodDespesa),
	CONSTRAINT FK2Pagamento FOREIGN KEY(Funcionario) REFERENCES Pessoa(CPF)
	);

--Criando a relação Fornecedor
	CREATE TABLE Fornecedor(
	CNPJ VARCHAR(20),
	Nome VARCHAR(100) NOT NULL,
	Telefone VARCHAR(20) NOT NULL,
	Cidade VARCHAR(50) NOT NULL,
	Rua VARCHAR(100) NOT NULL,
	Bairro VARCHAR(100) NOT NULL,
	CONSTRAINT PKFornecedor PRIMARY KEY(CNPJ)
	);




--Criando a relação Compra
	CREATE TABLE Compra(
	CodCompra INT,
	Fornecedor VARCHAR(20) NOT NULL,
	Hora TIME NOT NULL,
	CodDespesa INT NOT NULL,
	CONSTRAINT PKCompra PRIMARY KEY (CodCompra),
	CONSTRAINT FK1Compra FOREIGN KEY(Fornecedor) REFERENCES Fornecedor(CNPJ),
	CONSTRAINT FK2Compra FOREIGN KEY(CodDespesa) REFERENCES Despesa(CodDespesa)
	);

--Criando a relação Produto
	CREATE TABLE Produto(
	Codigo INT,
	Tamanho VARCHAR(5) NOT NULL,
	Status VARCHAR(12) NOT NULL,
	Nome VARCHAR(50) NOT NULL,
	PrecoVenda REAL NOT NULL,
	CONSTRAINT PKProduto PRIMARY KEY (Codigo),
	CONSTRAINT PrecoPositivo CHECK(PrecoVenda>0)
	);

--Criando a relação CompraProduto
	CREATE TABLE CompraProduto(
	CodProduto INT,
	CodCompra INT,
	quantidade INT NOT NULL,
	precoUnitario REAL NOT NULL,
	CONSTRAINT PKCompraProduto PRIMARY KEY(CodProduto, CodCompra),
	CONSTRAINT FK1CompraProduto FOREIGN KEY(CodProduto) REFERENCES 	Produto(Codigo),
	CONSTRAINT FK2CompraProduto FOREIGN KEY(CodCompra) REFERENCES 	Compra(CodCompra),
	CONSTRAINT CompraProdutoPositiva CHECK (precoUnitario>0)
	);

--Criando a relação Entrada
	CREATE TABLE Entrada(
	CodEntrada INT,
	Valor REAL NOT NULL,
	Data DATE NOT NULL,
	CONSTRAINT PKEntrada PRIMARY KEY (CodEntrada),
	CONSTRAINT EntradaPositiva CHECK(Valor>0)
	);

--Criando a relação Venda
	CREATE TABLE Venda(
	CodVenda INT,
	Hora TIME NOT NULL,
	Funcionario VARCHAR(20) NOT NULL,
	Cliente VARCHAR(20) NOT NULL,
	codEntrada INT NOT NULL,
	CONSTRAINT PKVenda PRIMARY KEY(CodVenda),
	CONSTRAINT FKVenda1 FOREIGN KEY(Funcionario) REFERENCES Pessoa(CPF),
	CONSTRAINT FKVenda2 FOREIGN KEY(Cliente) REFERENCES Pessoa(CPF),
	CONSTRAINT FKVenda3 FOREIGN KEY (codEntrada) REFERENCES Entrada(CodEntrada)
	);

--Criando a relação VendaProduto
	CREATE TABLE VendaProduto(
	CodProduto INT,
	CodVenda INT,
	Quantidade INT NOT NULL,
	precoUnitario REAL NOT NULL,
	CONSTRAINT PKVendaProduto PRIMARY KEY(CodProduto, CodVenda),
	CONSTRAINT FK1VendaProduto FOREIGN KEY(CodProduto) REFERENCES 	Produto(Codigo),
	CONSTRAINT FK2VendaProduto FOREIGN KEY(CodVenda) REFERENCES 	Venda(CodVenda),
	CONSTRAINT VendaProdutoPositiva CHECK (precoUnitario>0)
	);


--Criando a relação CartaoCredito
	CREATE TABLE CartaoCredito(
	Numero VARCHAR(50),
	Bandeira VARCHAR(20) NOT NULL,
	CONSTRAINT PKCartaoCredito PRIMARY KEY(Numero)
	);

--Criando a relação VendaCartao
	CREATE TABLE VendaCartao(
	NumCartao VARCHAR(50),
	CodVenda INT NOT NULL,
	NumParcelas INT NOT NULL,
	CONSTRAINT PKVendaCartao PRIMARY KEY(NumCartao),
	CONSTRAINT FKVendaCartao1 FOREIGN KEY(NumCartao) REFERENCES 	CartaoCredito(Numero),
	CONSTRAINT FKVendaCartao2 FOREIGN KEY(CodVenda) REFERENCES 	Venda(CodVenda)
	);
