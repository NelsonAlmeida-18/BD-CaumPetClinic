USE CaumPetClinic;

-- Criação e uma nova tabela - "Logs"
-- Implementação de um jornal de eventos para o sistema.
-- Tabela que acolhe o registo de eventos ocorridos no sistema.
-- DROP TABLE JornalEventos;
-- DESC JornalEventos;
CREATE TABLE IF NOT EXISTS Logs (
	Número INT NOT NULL AUTO_INCREMENT,
	DataHora DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
	Descrição VARCHAR (200) NOT NULL DEFAULT 'Operação não definida',
		PRIMARY KEY (Número)
)
	ENGINE=InnoDB 
    DEFAULT CHARSET=utf8mb4;
    

-- Transações a definir
-- Criar Pedido
-- Alterar Pedido
-- Entregar Pedido
-- Dar uma avaliação a um pedido (exclusivo ao user)
-- Inserção de um novo perfil no sistema => User, animal, morada, contacto

DELIMITER $$
CREATE PROCEDURE criaPedido(
    IN NIFCliente INT,
    IN idAnimal INT,
    IN idServico INT,
    IN idClinica INT,
    IN dataEntrega DATE,
    IN dataRecolha DATE,
    OUT result INT)
    
criaPedido:Begin
	Declare v_totalPedido Float;
    Declare v_idPedido INT;
    Declare v_valorBase Float;
    
    -- Declaração de variáveis de controlo e de um handler para deteção
    -- da ocorrência de exceções SQL
        
    DECLARE vErro INT DEFAULT 0;
    DECLARE CONTINUE HANDLER 
        FOR SQLEXCEPTION 
			SET vErro = 1;

	-- Início da transação da venda
    -- definir custo final
    -- verificar se o servico existe
    -- verificar se o animal consta na base de dados
    -- verificar se o cliente consta na base de dados, 
    -- verficiar se a data da entrega é após a data de recolha
    -- verificar se as datas são após a data de hoje+ threshold de processamento,
    -- verificar se a clinica existe na base de dados
    
    START TRANSACTION;
    
		select custoFinal into v_valorBase, IdServico from Servico where IdServico=idServico;
        -- custo do servico + custo de entrega que neste caso é um valor aleatório entre 5 e 10
        select (RAND()*(10-5)+5)+v_valorBase into v_valorBase;
        select ROUND(v_valorBase, 2) as v_valorBase;
        
		select max(idPedido)+1 into v_idPedido from Pedido;
        insert into CaumPetClinic.Pedido(idPedido, dataEstimadaRecolha, dataEfetivaRecolha, dataEstimadaEntrega, dataEfetivaEntrega, avaliacao, custoFinal, Animal_idAnimal, Servico_idServico, Funcionario_NIF, Clinica_idClinica)
		values(v_idPedido,dataRecolha, null, dataEntrega,null, null,  , idAnimal,idServico, , idClinica);

        
    
    End;
    $$
    
-- Numero de pedidos por cliente de cada clinica este mês

delimiter $$
create procedure pedidosClientes()
BEGIN
	declare month DATE;
    
	select MONTH(NOW()) as month;
    
    
END
$$


-- Funções/ Queries a definir
-- Contabilizar o numero de consultas por dia
-- Listagem do top 3 clientes mensais 
-- Listagem do top 3 estafetas mensais
-- Top Clinica Mensal