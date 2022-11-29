-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema CaumPetClinic
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `CaumPetClinic` ;

-- -----------------------------------------------------
-- Schema CaumPetClinic
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `CaumPetClinic` DEFAULT CHARACTER SET utf8 ;
USE `CaumPetClinic` ;

-- -----------------------------------------------------
-- Table `CaumPetClinic`.`Morada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CaumPetClinic`.`Morada` (
  `idMorada` INT NOT NULL,
  `codPostal` VARCHAR(45) NOT NULL,
  `rua` VARCHAR(45) NOT NULL,
  `localidade` VARCHAR(45) NOT NULL,
  `porta` VARCHAR(45) NOT NULL,
  `piso` VARCHAR(45) NULL,
  PRIMARY KEY (`idMorada`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idMorada_UNIQUE` ON `CaumPetClinic`.`Morada` (`idMorada` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `CaumPetClinic`.`Contacto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CaumPetClinic`.`Contacto` (
  `idContacto` INT NOT NULL,
  `telemovel` VARCHAR(45) NULL,
  `telefone` VARCHAR(45) NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idContacto`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idContacto_UNIQUE` ON `CaumPetClinic`.`Contacto` (`idContacto` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `CaumPetClinic`.`Clinica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CaumPetClinic`.`Clinica` (
  `idClinica` INT NOT NULL,
  `Morada_idMorada` INT NOT NULL,
  `Contacto_idContacto` INT NOT NULL,
  PRIMARY KEY (`idClinica`, `Morada_idMorada`, `Contacto_idContacto`),
  CONSTRAINT `fk_Clinica_Morada1`
    FOREIGN KEY (`Morada_idMorada`)
    REFERENCES `CaumPetClinic`.`Morada` (`idMorada`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Clinica_Contacto1`
    FOREIGN KEY (`Contacto_idContacto`)
    REFERENCES `CaumPetClinic`.`Contacto` (`idContacto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idClinica_UNIQUE` ON `CaumPetClinic`.`Clinica` (`idClinica` ASC) VISIBLE;

CREATE INDEX `fk_Clinica_Morada1_idx` ON `CaumPetClinic`.`Clinica` (`Morada_idMorada` ASC) VISIBLE;

CREATE INDEX `fk_Clinica_Contacto1_idx` ON `CaumPetClinic`.`Clinica` (`Contacto_idContacto` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `CaumPetClinic`.`Carrinha`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CaumPetClinic`.`Carrinha` (
  `matricula` VARCHAR(45) NOT NULL,
  `kmsNaUltimaUtil` INT NOT NULL,
  `emUso` TINYINT NOT NULL,
  `Clinica_idClinica` INT NOT NULL,
  PRIMARY KEY (`matricula`, `Clinica_idClinica`),
  CONSTRAINT `fk_Carrinha_Clinica`
    FOREIGN KEY (`Clinica_idClinica`)
    REFERENCES `CaumPetClinic`.`Clinica` (`idClinica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `matricula_UNIQUE` ON `CaumPetClinic`.`Carrinha` (`matricula` ASC) VISIBLE;

CREATE INDEX `fk_Carrinha_Clinica_idx` ON `CaumPetClinic`.`Carrinha` (`Clinica_idClinica` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `CaumPetClinic`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CaumPetClinic`.`Funcionario` (
  `NIF` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `dataDeNascimento` DATE NOT NULL,
  `cargo` VARCHAR(45) NOT NULL,
  `avaliacao` INT NULL,
  `Clinica_idClinica` INT NOT NULL,
  `Morada_idMorada` INT NOT NULL,
  `Contacto_idContacto` INT NOT NULL,
  PRIMARY KEY (`NIF`, `Clinica_idClinica`, `Morada_idMorada`, `Contacto_idContacto`),
  CONSTRAINT `fk_Funcionario_Clinica1`
    FOREIGN KEY (`Clinica_idClinica`)
    REFERENCES `CaumPetClinic`.`Clinica` (`idClinica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Funcionario_Morada1`
    FOREIGN KEY (`Morada_idMorada`)
    REFERENCES `CaumPetClinic`.`Morada` (`idMorada`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Funcionario_Contacto1`
    FOREIGN KEY (`Contacto_idContacto`)
    REFERENCES `CaumPetClinic`.`Contacto` (`idContacto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Funcionario_Clinica1_idx` ON `CaumPetClinic`.`Funcionario` (`Clinica_idClinica` ASC) VISIBLE;

CREATE INDEX `fk_Funcionario_Morada1_idx` ON `CaumPetClinic`.`Funcionario` (`Morada_idMorada` ASC) VISIBLE;

CREATE INDEX `fk_Funcionario_Contacto1_idx` ON `CaumPetClinic`.`Funcionario` (`Contacto_idContacto` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `CaumPetClinic`.`Servico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CaumPetClinic`.`Servico` (
 `idServico` INT NOT NULL,
  `tipoServico` VARCHAR(200) NOT NULL,
  `descricao` VARCHAR(500) NOT NULL,
  `valorBase` INT NOT NULL,
  `lucro` INT NOT NULL,
  `Clinica_idClinica` INT NOT NULL,
  PRIMARY KEY (`idServico`, `Clinica_idClinica`),
  CONSTRAINT `fk_Servico_Clinica1`
    FOREIGN KEY (`Clinica_idClinica`)
    REFERENCES `CaumPetClinic`.`Clinica` (`idClinica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idServico_UNIQUE` ON `CaumPetClinic`.`Servico` (`idServico` ASC) VISIBLE;

CREATE INDEX `fk_Servico_Clinica1_idx` ON `CaumPetClinic`.`Servico` (`Clinica_idClinica` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `CaumPetClinic`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CaumPetClinic`.`Cliente` (
  `NIF` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `dataDeNascimento` DATE NOT NULL,
  `pontos` VARCHAR(45) NOT NULL,
  `Contacto_idContacto` INT NOT NULL,
  `Morada_idMorada` INT NOT NULL,
  PRIMARY KEY (`NIF`, `Contacto_idContacto`, `Morada_idMorada`),
  CONSTRAINT `fk_Cliente_Contacto1`
    FOREIGN KEY (`Contacto_idContacto`)
    REFERENCES `CaumPetClinic`.`Contacto` (`idContacto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cliente_Morada1`
    FOREIGN KEY (`Morada_idMorada`)
    REFERENCES `CaumPetClinic`.`Morada` (`idMorada`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `NIF_UNIQUE` ON `CaumPetClinic`.`Cliente` (`NIF` ASC) VISIBLE;

CREATE INDEX `fk_Cliente_Contacto1_idx` ON `CaumPetClinic`.`Cliente` (`Contacto_idContacto` ASC) VISIBLE;

CREATE INDEX `fk_Cliente_Morada1_idx` ON `CaumPetClinic`.`Cliente` (`Morada_idMorada` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `CaumPetClinic`.`Boletim`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CaumPetClinic`.`Boletim` (
  `idBoletim` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `dataDeNascimento` DATE NOT NULL,
  `peso` INT NOT NULL,
  `especie` VARCHAR(45) NOT NULL,
  `raca` VARCHAR(45) NOT NULL,
  `vacinas` VARCHAR(500) NULL,
  `historico` VARCHAR(500) NULL,
  PRIMARY KEY (`idBoletim`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idBoletim_UNIQUE` ON `CaumPetClinic`.`Boletim` (`idBoletim` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `CaumPetClinic`.`Animal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CaumPetClinic`.`Animal` (
  `idAnimal` INT NOT NULL,
  `Boletim_idBoletim` INT NOT NULL,
  PRIMARY KEY (`idAnimal`, `Boletim_idBoletim`),
  CONSTRAINT `fk_Animal_Boletim1`
    FOREIGN KEY (`Boletim_idBoletim`)
    REFERENCES `CaumPetClinic`.`Boletim` (`idBoletim`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idAnimal_UNIQUE` ON `CaumPetClinic`.`Animal` (`idAnimal` ASC) VISIBLE;

CREATE INDEX `fk_Animal_Boletim1_idx` ON `CaumPetClinic`.`Animal` (`Boletim_idBoletim` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `CaumPetClinic`.`Cliente_has_Animal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CaumPetClinic`.`Cliente_has_Animal` (
  `Cliente_NIF` INT NOT NULL,
  `Animal_idAnimal` INT NOT NULL,
  PRIMARY KEY (`Cliente_NIF`, `Animal_idAnimal`),
  CONSTRAINT `fk_Cliente_has_Animal_Cliente1`
    FOREIGN KEY (`Cliente_NIF`)
    REFERENCES `CaumPetClinic`.`Cliente` (`NIF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cliente_has_Animal_Animal1`
    FOREIGN KEY (`Animal_idAnimal`)
    REFERENCES `CaumPetClinic`.`Animal` (`idAnimal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Cliente_has_Animal_Animal1_idx` ON `CaumPetClinic`.`Cliente_has_Animal` (`Animal_idAnimal` ASC) VISIBLE;

CREATE INDEX `fk_Cliente_has_Animal_Cliente1_idx` ON `CaumPetClinic`.`Cliente_has_Animal` (`Cliente_NIF` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `CaumPetClinic`.`Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CaumPetClinic`.`Pedido` (
  `idPedido` INT NOT NULL,
  `data` VARCHAR(45) NULL,
  `dataEstimEntre` VARCHAR(45) NULL,
  PRIMARY KEY (`idPedido`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idPedido_UNIQUE` ON `CaumPetClinic`.`Pedido` (`idPedido` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `CaumPetClinic`.`Carrinha_has_Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CaumPetClinic`.`Carrinha_has_Funcionario` (
  `Carrinha_matricula` VARCHAR(45) NOT NULL,
  `Funcionario_NIF` INT NOT NULL,
  `emUtilizacao` INT NOT NULL,
  PRIMARY KEY (`Carrinha_matricula`, `Funcionario_NIF`, `emUtilizacao`),
  CONSTRAINT `fk_Carrinha_has_Funcionario_Carrinha1`
    FOREIGN KEY (`Carrinha_matricula`)
    REFERENCES `CaumPetClinic`.`Carrinha` (`matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Carrinha_has_Funcionario_Funcionario1`
    FOREIGN KEY (`Funcionario_NIF`)
    REFERENCES `CaumPetClinic`.`Funcionario` (`NIF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Carrinha_has_Funcionario_Funcionario1_idx` ON `CaumPetClinic`.`Carrinha_has_Funcionario` (`Funcionario_NIF` ASC) VISIBLE;

CREATE INDEX `fk_Carrinha_has_Funcionario_Carrinha1_idx` ON `CaumPetClinic`.`Carrinha_has_Funcionario` (`Carrinha_matricula` ASC) VISIBLE;

CREATE UNIQUE INDEX `emUtilizacao_UNIQUE` ON `CaumPetClinic`.`Carrinha_has_Funcionario` (`emUtilizacao` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `CaumPetClinic`.`Cliente_has_Animal_has_Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CaumPetClinic`.`Cliente_has_Animal_has_Pedido` (
  `Cliente_NIF` INT NOT NULL,
  `Animal_idAnimal` INT NOT NULL,
  `Pedido_idPedido` INT NOT NULL,
  PRIMARY KEY (`Cliente_NIF`, `Animal_idAnimal`, `Pedido_idPedido`),
  CONSTRAINT `fk_Cliente_has_Animal_has_Pedido_Cliente_has_Animal1`
    FOREIGN KEY (`Cliente_NIF` , `Animal_idAnimal`)
    REFERENCES `CaumPetClinic`.`Cliente_has_Animal` (`Cliente_NIF` , `Animal_idAnimal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cliente_has_Animal_has_Pedido_Pedido1`
    FOREIGN KEY (`Pedido_idPedido`)
    REFERENCES `CaumPetClinic`.`Pedido` (`idPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Cliente_has_Animal_has_Pedido_Pedido1_idx` ON `CaumPetClinic`.`Cliente_has_Animal_has_Pedido` (`Pedido_idPedido` ASC) VISIBLE;

CREATE INDEX `fk_Cliente_has_Animal_has_Pedido_Cliente_has_Animal1_idx` ON `CaumPetClinic`.`Cliente_has_Animal_has_Pedido` (`Cliente_NIF` ASC, `Animal_idAnimal` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `CaumPetClinic`.`Pedido_has_Servico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CaumPetClinic`.`Pedido_has_Servico` (
  `Pedido_idPedido` INT NOT NULL,
  `Servico_idServico` INT NOT NULL,
  `Clinica_idClinica` INT NOT NULL,
  PRIMARY KEY (`Pedido_idPedido`, `Servico_idServico`, `Clinica_idClinica`),
  CONSTRAINT `fk_Pedido_has_Servico_Pedido1`
    FOREIGN KEY (`Pedido_idPedido`)
    REFERENCES `CaumPetClinic`.`Pedido` (`idPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_has_Servico_Servico1`
    FOREIGN KEY (`Servico_idServico` , `Clinica_idClinica`)
    REFERENCES `CaumPetClinic`.`Servico` (`idServico` , `Clinica_idClinica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Pedido_has_Servico_Servico1_idx` ON `CaumPetClinic`.`Pedido_has_Servico` (`Servico_idServico` ASC, `Clinica_idClinica` ASC) VISIBLE;

CREATE INDEX `fk_Pedido_has_Servico_Pedido1_idx` ON `CaumPetClinic`.`Pedido_has_Servico` (`Pedido_idPedido` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
