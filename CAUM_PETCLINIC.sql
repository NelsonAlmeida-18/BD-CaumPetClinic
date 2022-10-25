CREATE SCHEMA IF NOT EXISTS `CAUM_PETCLINIC`;
-- DROP TABLE `CAUM_PETCLINIC`.`Clinicas`

CREATE TABLE IF NOT EXISTS `CAUM_PETCLINIC`.`Boletins`(
	`idBoletim` INT UNIQUE NOT NULL,
    `nome` VARCHAR(45) NOT NULL,
    `idade`INT NOT NULL,
    `peso` INT NOT NULL,
    `intervencoesPassadas` BLOB NULL,
    PRIMARY KEY(`idBoletim`)
);

CREATE TABLE IF NOT EXISTS `CAUM_PETCLINIC`.`Moradas`(
	`codigoPostal` VARCHAR(45) NOT NULL,
    `rua` VARCHAR(150) NOT NULL,
    `localidade` VARCHAR(150) NOT NULL,
    `numeroDePorta` VARCHAR(45) NOT NULL,
    PRIMARY KEY(`codigoPostal`, `rua`, `localidade`,`numeroDePorta`)
);

CREATE TABLE IF NOT EXISTS `CAUM_PETCLINIC`.`Estafetas`(
	`idEstafeta` INT NOT NULL UNIQUE,
    `nome` VARCHAR(150) NOT NULL,
    `contacto` VARCHAR(45) NOT NULL UNIQUE,
    PRIMARY KEY(`idEstafeta`)
);

CREATE TABLE IF NOT EXISTS `CAUM_PETCLINIC`.`Colaboradores`(
	`idColaborador` INT NOT NULL UNIQUE,
    `nome` VARCHAR(150) NOT NULL,
    `cargo` INT NOT NULL,
    `contacto` INT NOT NULL UNIQUE,
    `idClinica` INT NOT NULL UNIQUE,
    PRIMARY KEY(`idColaborador`),
    FOREIGN KEY(`idClinica`) REFERENCES `CAUM_PETCLINIC`.`Clinicas`(`idClinica`)
);

CREATE TABLE IF NOT EXISTS `CAUM_PETCLINIC`.`Animais`(
	`idAnimal` INT NOT NULL UNIQUE,
    PRIMARY KEY(`idAnimal`)
);

CREATE TABLE IF NOT EXISTS `CAUM_PETCLINIC`.`Clientes`(
	`id` INT NOT NULL UNIQUE,
    `nome`VARCHAR(150) NOT NULL,
    `contacto` VARCHAR(150) NOT NULL UNIQUE,
    PRIMARY KEY(`id`)
);

CREATE TABLE IF NOT EXISTS `CAUM_PETCLINIC`.`Clinicas`(
	`idClinica`INT NOT NULL UNIQUE,
    `administrador` INT NOT NULL UNIQUE,
    PRIMARY KEY(`idClinica`)
);

SELECT * FROM `CAUM_PETCLINIC`.`Colaboradores`