USE CaumPetClinic;

-- Criação do utilizador 'admin'
CREATE USER 'adminPR'@'localhost';
SET PASSWORD FOR 'adminPR'@'localhost' = 'PauloRochaLCC';

-- Criação do utilizador 'prog'
CREATE USER 'prog'@'localhost';
SET PASSWORD FOR 'prog'@'localhost' = 'prog1234';

-- Criação do utilizador gestor de clinica da clinica 0
CREATE USER 'adminClinica0'@'localhost';
SET PASSWORD FOR 'adminClinica0'@'localhost' = 'clinicaAdaufe2020';

-- Criação do utilizador gestor de clinica da clinica 1
CREATE USER 'adminClinica1'@'localhost';
SET PASSWORD FOR 'adminClinica1'@'localhost' = '&clinicaTadim*';

-- Criação do utilizador gestor de clinica da clinica 2
CREATE USER 'adminClinica2'@'localhost';
SET PASSWORD FOR 'adminClinica2'@'localhost' = 'ReclinicaQuiao2122';

-- Criação do perfil de funcionário de cada clinica
CREATE USER 'funcionarioClinica0'@'localhost';
SET PASSWORD FOR 'funcionarioClinica0'@'localhost' = 'clinicaAdaufe';

CREATE USER 'funcionarioClinica1'@'localhost';
SET PASSWORD FOR 'funcionarioClinica1'@'localhost' = 'clinicaTadim';

CREATE USER 'funcionarioClinica2'@'localhost';
SET PASSWORD FOR 'funcionarioClinica2'@'localhost' = 'clinicaRequiao';

-- Criação do utilizador 'user'
CREATE USER 'user'@'localhost';
SET PASSWORD FOR 'user'@'localhost' = 'user1234';

-- Definição do utilizador estafeta
CREATE USER 'estafeta'@'localhost';
SET PASSWORD FOR 'estafeta'@'localhost' = 'passwordGenerica123';

-- Permissão de acesso a todos os objectos da base de dados em 'localhost'.
GRANT ALL ON CaumPetClinic.* TO 'adminPR'@'localhost';

-- Definição de alguns previlégios para o utilizador 'prog'. 
-- Permissão para a execução de instruções SELECT, INSERT e UPDATE na base de dados 
-- em 'localhost'.
GRANT SELECT, INSERT, UPDATE ON  CaumPetClinic.* TO 'prog'@'localhost';
-- Permissão para a criação e execução de procedimentos em 'localhost'.
GRANT CREATE ROUTINE ON CaumPetClinic.* TO 'prog'@'localhost';
GRANT EXECUTE ON CaumPetClinic.* TO 'prog'@'localhost';

-- Definição de alguns previlégios para os administradores
-- Permissão para a execução de instruções SELECT, INSERT e UPDATE na base de dados 
-- em 'localhost'.
GRANT SELECT, INSERT, UPDATE ON  CaumPetClinic.* TO 'adminClinica0'@'localhost';
GRANT SELECT, INSERT, UPDATE ON  CaumPetClinic.* TO 'adminClinica1'@'localhost';
GRANT SELECT, INSERT, UPDATE ON  CaumPetClinic.* TO 'adminClinica2'@'localhost';

-- Definição de alguns previlégios para os funcionarios
-- Permissão para a execução de instruções SELECT, INSERT e UPDATE na base de dados 
-- em 'localhost'.
GRANT SELECT, INSERT ON  CaumPetClinic.* TO 'funcionarioClinica0'@'localhost';
GRANT SELECT, INSERT ON  CaumPetClinic.* TO 'funcionarioClinica1'@'localhost';
GRANT SELECT, INSERT ON  CaumPetClinic.* TO 'funcionarioClinica2'@'localhost';
GRANT SELECT, UPDATE ON  CaumPetClinic.Pedido TO 'estafeta'@'localhost';


GRANT SELECT, UPDATE ON CaumPetClinic.Pedido TO 'user'@'localhost';



