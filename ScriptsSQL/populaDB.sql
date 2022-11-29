#criar clinicas

insert into CaumPetClinic.Morada (idMorada,codPostal, rua, localidade, porta, piso)
values(0,"4710-167", "Rua Soldado Manuel Pinheiro", "Adaúfe", "7", null);
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso)
values(1,"4705-472", "Rua Cruz de Vilar", "Tadim", "31", null);
insert into CaumPetClinic.Morada (idMorada,codPostal, rua, localidade, porta, piso)
values(2,"4770-121", "Rua Joao Carlos Pereira", "Requião", "189", null);

insert into CaumPetClinic.Contacto (idContacto, telemovel, telefone, email)
values(0, null, 253577270, "geral.adaufe@caumpetclinic.pt");
insert into CaumPetClinic.Contacto (idContacto, telemovel, telefone, email)
values(1, null, 253577271, "geral.tadim@caumpetclinic.pt");
insert into CaumPetClinic.Contacto (idContacto, telemovel, telefone, email)
values(2, null, 253577272, "geral.requiao@caumpetclinic.pt");


insert into CaumPetClinic.Clinica (idClinica, Morada_idMorada, Contacto_idContacto)
values(0, 0, 0);
insert into CaumPetClinic.Clinica (idClinica, Morada_idMorada, Contacto_idContacto)
values(1, 1, 1);
insert into CaumPetClinic.Clinica (idClinica, Morada_idMorada, Contacto_idContacto)
values(2, 2, 2);

#Funcionario 0
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(3,"6578-440","Travessa  Estrela de Ouro","Sequeira","322","null");
insert into CaumPetClinic.Contacto (idContacto, telemovel, telefone, email)
values("3", "934049192", null, "Domingas.Gomes141@yahoo.com");
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao, Clinica_idClinica, Morada_idMorada, Contacto_idContacto)
values("29555791", "Domingas Santos Ribeiro Gomes", DATE("1983-1-17"), "Estafeta", null, 0,3,3);

#Funcionario 1
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(4,"2588-591","Travessa  Vilar do Paraíso","Pego","16","null");
insert into CaumPetClinic.Contacto (idContacto, telemovel, telefone, email)
values("4", "919874796", null, "Ana.Ferreira745@gmail.pt");
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao, Clinica_idClinica, Morada_idMorada, Contacto_idContacto)
values("247189267", "Ana Freitas Francisco Ferreira", DATE("2000-10-11"), "Estafeta", null, 1,4,4);

#Funcionario 2
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(5,"3729-430","Travessa do do Ferro","Meirinhos","811","8T");
insert into CaumPetClinic.Contacto (idContacto, telemovel, telefone, email)
values("5", "950862191", null, "Teresa.Ferreira@gmail.com");
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao, Clinica_idClinica, Morada_idMorada, Contacto_idContacto)
values("65872833", "Teresa Freitas Gonçalves Ferreira", DATE("2001-5-13"), "Estafeta", null, 2,5,5);

#Funcionario 3
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(6,"5089-409","Travessa do Soldado Manuel Pinheiro","Pego","980","9T");
insert into CaumPetClinic.Contacto (idContacto, telemovel, telefone, email)
values("6", "924434797", null, "Joaquim.Costa886@outlook.pt");
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao, Clinica_idClinica, Morada_idMorada, Contacto_idContacto)
values("49883011", "Joaquim Pereira Silva Costa", DATE("1980-10-2"), "Estafeta", null, 0,6,6);

#Funcionario 4
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(7,"5699-595","Travessa  Santa Engrácia","Bruçó","953","null");
insert into CaumPetClinic.Contacto (idContacto, telemovel, telefone, email)
values("7", "911249234", null, "Ana.Lopes843@hotmail.com");
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao, Clinica_idClinica, Morada_idMorada, Contacto_idContacto)
values("71552805", "Ana Ribeiro Ferreira Lopes", DATE("1977-10-5"), "Estafeta", null, 1,7,7);

#Funcionario 5
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(8,"8034-725","Travessa do Almirante Lopes","São Félix da Marinha","19","null");
insert into CaumPetClinic.Contacto (idContacto, telemovel, telefone, email)
values("8", "966819015", null, "António.Francisco671@hotmail.pt");
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao, Clinica_idClinica, Morada_idMorada, Contacto_idContacto)
values("46618687", "António Francisco", DATE("1992-7-1"), "Estafeta", null, 2,8,8);

#Funcionario 6
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(9,"9914-729","Rua do Facho","Mafamude","411","null");
insert into CaumPetClinic.Contacto (idContacto, telemovel, telefone, email)
values("9", "919083800", null, "Bento.Fernandes084@gmail.com");
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao, Clinica_idClinica, Morada_idMorada, Contacto_idContacto)
values("50682714", "Bento Pereira Costa Fernandes", DATE("1975-5-4"), "Estafeta", null, 0,9,9);

#Funcionario 7
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(10,"6041-350","Travessa  Dom Diogo de Sousa","Fiães","678","null");
insert into CaumPetClinic.Contacto (idContacto, telemovel, telefone, email)
values("10", "934373719", null, "Mariana.Fernandes@gmail.pt");
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao, Clinica_idClinica, Morada_idMorada, Contacto_idContacto)
values("53344186", "Mariana Silva Fernandes", DATE("1986-7-14"), "Estafeta", null, 1,10,10);

#Funcionario 8
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(11,"0504-544","Rua do Bela Vista","Moimenta","403","6F");
insert into CaumPetClinic.Contacto (idContacto, telemovel, telefone, email)
values("11", "967304539", null, "Carlos.Santos@hotmail.com");
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao, Clinica_idClinica, Morada_idMorada, Contacto_idContacto)
values("217107029", "Carlos Dias Nunes Santos", DATE("1999-1-21"), "Estafeta", null, 2,11,11);

#Funcionario 9
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(12,"5531-522","Rua da 25 de Abril","São Félix da Marinha","824","6D");
insert into CaumPetClinic.Contacto (idContacto, telemovel, telefone, email)
values("12", "917033148", null, "Domingas.Fernandes326@outlook.pt");
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao, Clinica_idClinica, Morada_idMorada, Contacto_idContacto)
values("100778975", "Domingas Mendes Fernandes", DATE("1988-2-18"), "Estafeta", null, 0,12,12);

#Funcionario 10
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(13,"3104-598","Travessa da do Ferro","Rio Torto","253","null");
insert into CaumPetClinic.Contacto (idContacto, telemovel, telefone, email)
values("13", "969308307", null, "Teresa.Ferreira@outlook.com");
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao, Clinica_idClinica, Morada_idMorada, Contacto_idContacto)
values("36979580", "Teresa Martins Francisco Ferreira", DATE("2000-7-13"), "Estafeta", null, 1,13,13);

#Funcionario 11
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(14,"6243-236","Rua de 19 de Junho","Moimenta","501","2T");
insert into CaumPetClinic.Contacto (idContacto, telemovel, telefone, email)
values("14", "929133232", null, "Rita.Almeida493@hotmail.pt");
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao, Clinica_idClinica, Morada_idMorada, Contacto_idContacto)
values("67755368", "Rita Almeida", DATE("2001-3-3"), "Estafeta", null, 2,14,14);

#Funcionario 12
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(15,"3470-410","Rua do do Ferro","Rio Torto","425","null");
insert into CaumPetClinic.Contacto (idContacto, telemovel, telefone, email)
values("15", "969536951", null, "Ana.Mendes@yahoo.pt");
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao, Clinica_idClinica, Morada_idMorada, Contacto_idContacto)
values("128465034", "Ana Gonçalves Dias Mendes", DATE("1973-3-19"), "Estafeta", null, 0,15,15);

#Funcionario 13
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(16,"9560-374","Rua de do Ferro","Santo Inácio","882","null");
insert into CaumPetClinic.Contacto (idContacto, telemovel, telefone, email)
values("16", "922555035", null, "Rita.Rodrigues936@outlook.pt");
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao, Clinica_idClinica, Morada_idMorada, Contacto_idContacto)
values("46457182", "Rita Ribeiro Rodrigues", DATE("1999-8-3"), "Estafeta", null, 1,16,16);

#Funcionario 14
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(17,"2551-486","Travessa  Bela Vista","Cortiçada","100","2F");
insert into CaumPetClinic.Contacto (idContacto, telemovel, telefone, email)
values("17", "936505776", null, "Carlos.Pereira@yahoo.pt");
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao, Clinica_idClinica, Morada_idMorada, Contacto_idContacto)
values("39762441", "Carlos Mendes Pereira", DATE("1996-10-27"), "Estafeta", null, 2,17,17);

#Funcionario 15
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(18,"5254-179","Travessa da Santa Casa da Misericórdia","São Félix da Marinha","569","6F");
insert into CaumPetClinic.Contacto (idContacto, telemovel, telefone, email)
values("18", "915647181", null, "João.Silva200@hotmail.com");
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao, Clinica_idClinica, Morada_idMorada, Contacto_idContacto)
values("152944246", "João Silva", DATE("1975-5-20"), "Estafeta", null, 0,18,18);

#Funcionario 16
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(19,"4223-760","Travessa do Almirante Lopes","Meirinhos","344","3E");
insert into CaumPetClinic.Contacto (idContacto, telemovel, telefone, email)
values("19", "953833731", null, "Carlos.Silva@hotmail.com");
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao, Clinica_idClinica, Morada_idMorada, Contacto_idContacto)
values("225336527", "Carlos Silva", DATE("1979-6-25"), "Estafeta", null, 1,19,19);

#Funcionario 17
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(20,"8474-079","Travessa da São Vicente de Fora","Mafamude","894","9T");
insert into CaumPetClinic.Contacto (idContacto, telemovel, telefone, email)
values("20", "939656237", null, "Francisco.Ferreira614@hotmail.pt");
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao, Clinica_idClinica, Morada_idMorada, Contacto_idContacto)
values("87563840", "Francisco Freitas Costa Ferreira", DATE("1987-5-12"), "Estafeta", null, 2,20,20);

#Funcionario 18
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(21,"2451-627","Rua da Santa Engrácia","Caldas de São Jorge","611","null");
insert into CaumPetClinic.Contacto (idContacto, telemovel, telefone, email)
values("21", "952510347", null, "Fernando.Mendes506@gmail.pt");
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao, Clinica_idClinica, Morada_idMorada, Contacto_idContacto)
values("233973658", "Fernando Francisco Ribeiro Mendes", DATE("1992-4-10"), "Estafeta", null, 0,21,21);

#Funcionario 19
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(22,"3082-427","Travessa da Vilar do Paraíso","Caldas de São Jorge","854","7D");
insert into CaumPetClinic.Contacto (idContacto, telemovel, telefone, email)
values("22", "910339606", null, "Bento.Fernandes@outlook.pt");
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao, Clinica_idClinica, Morada_idMorada, Contacto_idContacto)
values("86184471", "Bento Mendes Fernandes", DATE("1994-11-27"), "Estafeta", null, 1,22,22);

#Funcionario 20
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(23,"1510-775","Rua  19 de Junho","Caldas de São Jorge","968","null");
insert into CaumPetClinic.Contacto (idContacto, telemovel, telefone, email)
values("23", "957552823", null, "Domingos.Oliveira633@yahoo.com");
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao, Clinica_idClinica, Morada_idMorada, Contacto_idContacto)
values("132125989", "Domingos Oliveira", DATE("1999-6-23"), "Estafeta", null, 2,23,23);


select * from CaumPetClinic.Funcionario where Morada_idMorada=4;
