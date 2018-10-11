-- Povoando a relação Pessoa
INSERT INTO Pessoa VALUES('154.288.064-51', 'Teofanes Ferreira', '99123456');
INSERT INTO Pessoa VALUES('358.947.104-21', 'Milena Carvalho', '98752374');
INSERT INTO Pessoa VALUES('354.514.294-99', 'Manoel de Sousa', '93098725');
INSERT INTO Pessoa VALUES('734.042.214-51', 'Amanda Ferreira', '93827460');
INSERT INTO Pessoa VALUES('559.629.914-60', 'Maria das Graças', '99097162');
INSERT INTO Pessoa VALUES('695.997.444-54', 'Antonia Lins', '98152674');
INSERT INTO Pessoa VALUES('690.418.134-62', 'Eduardo Martins', '99523850');
INSERT INTO Pessoa VALUES('846.101.944-06', 'Ana Isabel dos Santos', '99825556');
INSERT INTO Pessoa VALUES('146.287.484-38', 'Junior da Silva', '99123499');
INSERT INTO Pessoa VALUES('819.174.014-18', 'Ricardo Costa', '99553400');

--Povoando a relação Funcionario
INSERT INTO Funcionario VALUES('846.101.944-06','Caixa','2017-11-10', 954.00, 'Efetivo','JD Oasis','Jose Lira de Menezes','Cajazeiras');
INSERT INTO Funcionario VALUES('146.287.484-38', 'Vendedor', '2017-07-05', 1050.00, 'Efetivo', 'Centro', 'Bonifácio Moura', 'Cajazeiras');
INSERT INTO Funcionario VALUES('690.418.134-62', 'Faxineiro', '2017-12-01', 954.00, 'Efetivo', 'Centro', '13 de Maio', 'Cajazeiras');
INSERT INTO Funcionario VALUES('358.947.104-21', 'Vendedor', '2017-08-11', 1200.50, 'Efetivo', 'Centro', 'Bonifácio Moura', 'Cajazeiras');
INSERT INTO Funcionario VALUES('559.629.914-60', 'Marketing', '2018-08-05', 1500.50, 'Efetivo', 'Centro', 'Bonifácio Moura', 'Cajazeiras');

--Povoando a relação Cliente
INSERT INTO Cliente VALUES('154.288.064-51', 'teofanesferreira@hotmail.com');
INSERT INTO Cliente VALUES('354.514.294-99', 'manoeldesousa@hotmail.com');
INSERT INTO Cliente VALUES('734.042.214-51', 'amandaferrreira@hotmail.com');
INSERT INTO Cliente VALUES('695.997.444-54', 'antonialins@hotmail.com');
INSERT INTO Cliente VALUES('819.174.014-18', 'ricardo123@hotmail.com');

--Povoando a relação Despesa
INSERT INTO Despesa VALUES(1, 954.00, '2017-12-15');
INSERT INTO Despesa VALUES(2, 1050.00, '2017-08-15');
INSERT INTO Despesa VALUES(3, 954.00, '2018-01-15');
INSERT INTO Despesa VALUES(4, 1200.50, '2017-09-15');
INSERT INTO Despesa VALUES(5, 1500.50, '2018-08-15');
INSERT INTO Despesa VALUES(6, 2500.00, '2017-11-10');
INSERT INTO Despesa VALUES(7, 1300.00, '2017-12-10');
INSERT INTO Despesa VALUES(8, 600.00, '2017-11-09');
INSERT INTO Despesa VALUES(9, 100.00, '2018-01-10');
INSERT INTO Despesa VALUES(10, 700.00, '2018-03-10');

--Povoando a relação Pagamento
INSERT INTO Pagamento VALUES(1, '559.629.914-60', '06:30:35', 1);
INSERT INTO Pagamento VALUES(2, '358.947.104-21', '12:30:00', 2);
INSERT INTO Pagamento VALUES(3, '690.418.134-62', '09:20:05', 3);
INSERT INTO Pagamento VALUES(4, '146.287.484-38', '17:30:00', 4);
INSERT INTO Pagamento VALUES(5, '846.101.944-06', '10:29:00', 5);

--Povoando a relação Fornecedor
INSERT INTO Fornecedor VALUES('85.296.634/0001-96', 'Megaduran', '3561-4578', 'Sousa', 'Rua Vitória Alves da Silva', 'Centro');
INSERT INTO Fornecedor VALUES('64.615.575/0001-00', 'Indivíduo Clothing', '3531-7788', 'Sousa', 'Rua Arquimedes Souto Maior', 'Fagundes Vieira');
INSERT INTO Fornecedor VALUES('96.531.803/0001-41', 'Gata Selvagem', '3531-3456', 'Juazeiro', 'Rua Barbacena', 'Novo Centro');
INSERT INTO Fornecedor VALUES('59.547.777/0001-13', 'Geisandre Lingerie', '3561-0978', 'João Pessoa', 'Rua Doutor João Soares', 'Loteamento Ciro Costa');
INSERT INTO Fornecedor VALUES('74.263.193/0001-00', 'Medson Clothing', '3531-4554', 'João Pessoa', 'Popular Senhor Batista', 'Cidade Nova');
INSERT INTO Fornecedor VALUES('51.795.917/0001-60', 'Havair', '3561-9976', 'Cajazeiras', 'Martins Monteiro', 'Centro');

--Povoando a relação Compra
INSERT INTO Compra VALUES(1, '85.296.634/0001-96', '08:50:00', 6);
INSERT INTO Compra VALUES(2, '64.615.575/0001-00', '09:45:00', 7);
INSERT INTO Compra VALUES(3, '96.531.803/0001-41', '11:20:00', 8);
INSERT INTO Compra VALUES(4, '59.547.777/0001-13', '08:23:00', 9);
INSERT INTO Compra VALUES(5, '74.263.193/0001-00', '10:34:00', 10);

--Povoando a relação Produto
INSERT INTO Produto VALUES(1001234, 'M', 'Disponível', 'Calça Skinny em Sarja', 59.90);
INSERT INTO Produto VALUES(1001235, 'M', 'Disponível', 'Camisa Branca Mullet', 45.50);
INSERT INTO Produto VALUES(1001236, 'GG', 'Indisponível', 'Camisa Estampada com Folhagem', 38.90);
INSERT INTO Produto VALUES(1001237, 'G', 'Disponível', 'Camisa Estampada com Amarração', 55.90);
INSERT INTO Produto VALUES(1001238, 'P', 'Disponível', 'Calça Mom Jeans', 75.90);
INSERT INTO Produto VALUES(1001239, 'Único', 'Disponível', 'Jaqueta de Frio Xadrez', 120.00);
INSERT INTO Produto VALUES(1001240, 'P', 'Indisponível', 'Cropped Azul Marinho', 35.50);
INSERT INTO Produto VALUES(1001241, 'PP', 'Disponível', 'Vestido Curto Florido', 65.00);
INSERT INTO Produto VALUES(1001242, 'GG', 'Disponível', 'Bermuda Jeans', 70.50);
INSERT INTO Produto VALUES(1001243, 'M', 'Disponível', 'Camisa Xadrez', 69.90);
INSERT INTO Produto VALUES(1001244, 'G', 'Indisponível', 'Camisa The Smiths', 45.50);
INSERT INTO Produto VALUES(1001245, 'P', 'Disponível', 'Saia Longa Branca', 60.80);
INSERT INTO Produto VALUES(1001246, 'PP', 'Disponível', 'Camisa Gola V', 60.00);
INSERT INTO Produto VALUES(1001247, 'M', 'Disponível', 'Bomber Jacket Nasa', 200.00);
INSERT INTO Produto VALUES(1001248, 'GG', 'Disponível', 'Saia Colegial', 60.00);
INSERT INTO Produto VALUES(1001249, 'Único', 'Disponível', 'Bikini Listrado', 59.90);
INSERT INTO Produto VALUES(1001250, 'M', 'Disponível', 'Blusão Estampado', 80.00);
INSERT INTO Produto VALUES(1001251, 'PP', 'Disponível', 'Camisa Social Preta', 100.00);
INSERT INTO Produto VALUES(1001252, 'M', 'Disponível', 'Vestido Longo Preto', 200.00);
INSERT INTO Produto VALUES(1001253, 'G', 'Disponível', 'Short Cintura Alta', 70.60);

--Povoando a relação CompraProduto
INSERT INTO CompraProduto VALUES(1001253, 1, 45, 55.00);
INSERT INTO CompraProduto VALUES(1001252, 2, 20, 170.00);
INSERT INTO CompraProduto VALUES(1001251, 3, 30, 80.00);
INSERT INTO CompraProduto VALUES(1001250, 4, 12, 60.00);
INSERT INTO CompraProduto VALUES(1001249, 5, 40, 40.00);

--Povoando a relação Entrada
INSERT INTO Entrada VALUES(12, 270.60, '2018-08-11');
INSERT INTO Entrada VALUES(13, 180.00, '2018-08-13');
INSERT INTO Entrada VALUES(14, 59.90, '2018-08-15');
INSERT INTO Entrada VALUES(15, 260.00, '2018-08-20');
INSERT INTO Entrada VALUES(16, 60.00, '2018-09-01');
INSERT INTO Entrada VALUES(17, 60.80, '2018-09-02');


--Povoando a relação Venda
INSERT INTO Venda VALUES(33, '11:09:00', '146.287.484-38', '154.288.064-51', 12);
INSERT INTO Venda VALUES(34, '09:34:55', '146.287.484-38', '354.514.294-99', 13);
INSERT INTO Venda VALUES(35, '08:23:40', '146.287.484-38', '734.042.214-51', 14);
INSERT INTO Venda VALUES(36, '15:02:22', '146.287.484-38', '695.997.444-54', 15);
INSERT INTO Venda VALUES(37, '17:20:00', '358.947.104-21', '695.997.444-54', 16);
INSERT INTO Venda VALUES(38, '08:10:12', '358.947.104-21', '819.174.014-18', 17);


--Povoando a relação VendaProduto
INSERT INTO VendaProduto VALUES(1001253, 33, 1, 70.60);
INSERT INTO VendaProduto VALUES(1001252, 33, 1, 200.00);
INSERT INTO VendaProduto VALUES(1001251, 34, 1, 100.00);
INSERT INTO VendaProduto VALUES(1001250, 34, 1, 80.00);
INSERT INTO VendaProduto VALUES(1001249, 33, 1, 59.90);

--Povoando a relação CartaoCredito
INSERT INTO CartaoCredito VALUES('5530330246021173','Master Card');
INSERT INTO CartaoCredito VALUES('4312092068980640', 'Visa');
INSERT INTO CartaoCredito VALUES('6363686632535781', 'Elo');
INSERT INTO CartaoCredito VALUES('5518757232660489', 'Master Card');
INSERT INTO CartaoCredito VALUES('4532399086941049', 'Visa');

--Povoando a relação VendaCartao
INSERT INTO VendaCartao VALUES('5530330246021173', 33, 3);
INSERT INTO VendaCartao VALUES('4312092068980640', 34, 2);
INSERT INTO VendaCartao VALUES('6363686632535781', 35, 2);
INSERT INTO VendaCartao VALUES('5518757232660489', 36, 2);
INSERT INTO VendaCartao VALUES('4532399086941049', 37, 2);
