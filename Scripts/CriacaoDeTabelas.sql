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
	rua VARCHAR(100) NOT NULL,
	bairro VARCHAR(100) NOT NULL,
	cidade VARCHAR(100) NOT NULL,
	status VARCHAR(20) NOT NULL,
	CONSTRAINT SalarioPositivo CHECK(salario>0),
	CONSTRAINT PKFuncionario PRIMARY KEY (cpfPessoa),
	CONSTRAINT FKFuncionario FOREIGN KEY(cpfPessoa) REFERENCES Pessoa(CPF)
	);

--Criando a relação Cliente
	CREATE TABLE Cliente(
	CPFPessoa VARCHAR(20),
	Email VARCHAR(100) NOT NULL UNIQUE,
	CONSTRAINT PKCliente PRIMARY KEY(CPFPessoa),
	CONSTRAINT FKCliente FOREIGN KEY(CPFPessoa) REFERENCES Pessoa(CPF)
	);

--Criando a relação Despesa
	CREATE TABLE Despesa(
	CodDespesa SERIAL,
	Valor REAL NOT NULL,
	Data DATE NOT NULL,
	CONSTRAINT PKDespesa PRIMARY KEY(CodDespesa),
	CONSTRAINT DespPositiva CHECK(Valor>0)
	);

--Criando a relação Pagamento
	CREATE TABLE Pagamento(
	CodPagamento SERIAL,
	Valor REAL NOT NULL,
	Data DATE NOT NULL,
	Funcionario VARCHAR(20) NOT NULL,
	Hora TIMESTAMP NOT NULL,
	CodDespesa INT NOT NULL,
	CONSTRAINT PKPagamento PRIMARY KEY(CodPagamento),
	CONSTRAINT FK1Pagamento FOREIGN KEY(CodDespesa) REFERENCES 	Despesa(CodDespesa),
	CONSTRAINT FK2Pagamento FOREIGN KEY(Funcionario) REFERENCES 	Funcionario(CPFPessoa),
	CONSTRAINT ValPositivo CHECK(Valor>0)
	);

--Criando a relação Fornecedor
	CREATE TABLE Fornecedor(
	CNPJ VARCHAR(20),
	Nome VARCHAR(100) NOT NULL,
	Telefone VARCHAR(20) NOT NULL,
	Cidade VARCHAR(50) NOT NULL,
	Rua VARCHAR(100) NOT NULL,
	Bairro VARCHAR(100) NOT NULL,
	CONSTRAINT PKFornecedor PRIMARY KEY(CNPJ),
	);




--Criando a relação Compra
	CREATE TABLE Compra(
	CodCompra SERIAL,
	Valor REAL NOT NULL,
	Quantidade INT NOT NULL,
	Data DATE NOT NULL,
	Fornecedor VARCHAR(20) NOT NULL,
	Hora TIMESTAMP NOT NULL,
	CodDespesa INT NOT NULL,
	CONSTRAINT PKCompra PRIMARY KEY (CodCompra),
	CONSTRAINT FK1Compra FOREIGN KEY(Fornecedor) REFERENCES Fornecedor(CNPJ),
	CONSTRAINT FK2Compra FOREIGN KEY(CodDespesa) REFERENCES Despesa(CodDespesa),
	CONSTRAINT CompraPositiva CHECK(Valor>0)
	);

--Criando a relação Produto
	CREATE TABLE Produto(
	Codigo SERIAL,
	Tamanho VARCHAR(2) NOT NULL,
	Status VARCHAR(12) NOT NULL,
	Nome VARCHAR(20) NOT NULL,
	Preço REAL NOT NULL,
	CONSTRAINT PKProduto PRIMARY KEY (Codigo),
	CONSTRAINT PrecoPositivo CHECK(Preçor>0)
	);

--Criando a relação CompraProduto
	CREATE TABLE CompraProduto(
	CodProduto INT,
	CodCompra INT,
	CONSTRAINT PKCompraProduto PRIMARY KEY(CodProduto, CodCompra),
	CONSTRAINT FK1CompraProduto FOREIGN KEY(CodProduto) REFERENCES 	Produto(Codigo),
	CONSTRAINT FK2CompraProduto FOREIGN KEY(CodCompra) REFERENCES 	Compra(CodCompra)
	);


--Criando a relação Venda
	CREATE TABLE Venda(
	CodVenda SERIAL,
	Data DATE NOT NULL,
	Hora TIMESTAMP NOT NULL,
	Total REAL NOT NULL,
	Funcionario VARCHAR(20) NOT NULL,
	Cliente VARCHAR(20) NOT NULL,
	CONSTRAINT PKVenda PRIMARY KEY(CodVenda),
	CONSTRAINT FKVenda1 FOREIGN KEY(Funcionario) REFERENCES 	Funcionario(CPFPessoa),
	CONSTRAINT FKVenda2 FOREIGN KEY(Cliente) REFERENCES 	Cliente(CPFPessoa)
	);

--Criando a relação VendaProduto
	CREATE TABLE VendaProduto(
	CodProduto INT,
	CodVenda INT,
	Quantidade INT NOT NULL,
	PrecoUnitario REAL NOT NULL,
	CONSTRAINT PKVendaProduto PRIMARY KEY(CodProduto, CodVenda),
	CONSTRAINT FK1VendaProduto FOREIGN KEY(CodProduto) REFERENCES 	Produto(Codigo),
	CONSTRAINT FK2VendaProduto FOREIGN KEY(CodCompra) REFERENCES 	Venda(CodVenda)
	);


--Criando a relação VendaProduto
	CREATE TABLE Produto(
	CodProduto INT,
	CodVenda INT,
	Quantidade INT NOT NULL,
	PrecoUnitario REAL NOT NULL,
	CONSTRAINT PKVendaProduto PRIMARY KEY (CodProduto, CodVenda),
	CONSTRAINT FK1VendaProduto FOREIGN KEY(CodProduto) REFERENCES 	Produto(Codigo),
	CONSTRAINT FK2VendaProduto FOREIGN KEY(CodVenda) REFERENCES 	Venda(CodVenda)
	);

--Criando a relação Entrada
	CREATE TABLE Entrada(
	CodEntrada SERIAL,
	CodVenda INT NOT NULL,
	Valor REAL NOT NULL,
	Data DATE NOT NULL,
	CONSTRAINT PKEntrada PRIMARY KEY (CodEntrada),
	FOREIGN KEY(CodVenda) REFERENCES Venda(CodVenda),
	CONSTRAINT EntradaPositiva CHECK(Valor>0)
	);

--Criando a relação CartaoCredito
	CREATE TABLE CartaoCredito(
	Numero INT,
	Bandeira INT NOT NULL,
	CONSTRAINT PKCartaoCredito PRIMARY KEY(Numero)
	);

--Criando a relação VendaCartao
	CREATE TABLE VendaCartao(
	NumCartao INT,
	CodVenda INT NOT NULL,
	NumParcelas INT NOT NULL,
	CONSTRAINT PKVendaCartao PRIMARY KEY(NumCartao),
	CONSTRAINT FKVendaCartao1 FOREIGN KEY(NumCartao) REFERENCES 	CartaoCredito(Numero),
	CONSTRAINT FKVendaCartao2 FOREIGN KEY(CodVenda) REFERENCES 	Venda(CodVenda)
	);
