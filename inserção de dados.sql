-- Ingrid Reupke Sbeguen Moran
-- ra: 2349388
-- https://github.com/ingridrsm/bd1

DROP TABLE IF EXISTS ALUNO, TURMA, AULA, SALA_DE_AULA, PROFESSOR, COREOGRAFO, COREOGRAFIA, MUSICA, FIGURINO, FIGURINISTA, ALUNO_PARTICIPA_TURMA, TURMA_TEM_AULA, AULA_POSSUI_SALA, PROF_MINISTRA_AULA, TURMA_DANCA_COREO, COREO_TEM_MUSICA, COREO_TEM_FIGURINO, FIGURINISTA_FAZ_FIGURINO, COREOGRAFIA_CRIADA;

CREATE TABLE ALUNO(
    id_aluno INTEGER,
    nome_aluno VARCHAR(50),
    telefone_aluno CHAR(11),
    PRIMARY KEY(id_aluno)
);

CREATE TABLE TURMA(
    codigo_turma INTEGER,
    nivel INTEGER,
    ano INTEGER,
    PRIMARY KEY(codigo_turma)
);

CREATE TABLE AULA(
    codigo_aula INTEGER,
    horario CHAR(5),
    data_aula CHAR(10),
    estilo_de_dança VARCHAR(30),
    PRIMARY KEY(codigo_aula)
);

CREATE TABLE SALA_DE_AULA(
    codigo_sala INTEGER,
    andar INTEGER,
    bloco CHAR(1),
    PRIMARY KEY(codigo_sala)
);

CREATE TABLE PROFESSOR(
    cpf_prof CHAR(11),
    nome_prof VARCHAR(50),
    telefone_prof CHAR(11),
    PRIMARY KEY(cpf_prof)
);

CREATE TABLE COREOGRAFO(
    cpf_coreo CHAR(11),
    nome_coreo VARCHAR(50),
    telefone_coreo CHAR(11),
    PRIMARY KEY(cpf_coreo)
);

CREATE TABLE COREOGRAFIA(
    codigo_coreo INTEGER,
    tema VARCHAR(50),
    duracao_coreo CHAR(5),
    PRIMARY KEY(codigo_coreo)
);

CREATE TABLE MUSICA(
    nome_musica VARCHAR(50),
    artista VARCHAR(50),
    duracao_musica CHAR(5),
    estilo_musica VARCHAR(20),
    PRIMARY KEY(nome_musica)
);

CREATE TABLE FIGURINO(
    id_figurino INTEGER,
    cor VARCHAR(20),
    estilo_figurino VARCHAR(20),
    PRIMARY KEY(id_figurino)
);

CREATE TABLE FIGURINISTA(
    cpf_figurinista CHAR(11),
    nome_figurinista VARCHAR(50),
    telefone_figurinista CHAR(11),
    PRIMARY KEY(cpf_figurinista)
);

CREATE TABLE ALUNO_PARTICIPA_TURMA(
    id_aluno INTEGER,
    codigo_turma INTEGER,
    PRIMARY KEY(id_aluno, codigo_turma),
    FOREIGN KEY(id_aluno) REFERENCES ALUNO(id_aluno),
    FOREIGN KEY(codigo_turma) REFERENCES TURMA(codigo_turma)
);

CREATE TABLE TURMA_TEM_AULA(
    codigo_turma INTEGER,
    codigo_aula INTEGER,
    PRIMARY KEY(codigo_aula),
    FOREIGN KEY(codigo_aula) REFERENCES AULA(codigo_aula),
    FOREIGN KEY(codigo_turma) REFERENCES TURMA(codigo_turma)
);

CREATE TABLE AULA_POSSUI_SALA(
    codigo_aula INTEGER,
    codigo_sala INTEGER,
    PRIMARY KEY(codigo_aula),
    FOREIGN KEY(codigo_aula) REFERENCES AULA(codigo_aula),
    FOREIGN KEY(codigo_sala) REFERENCES SALA_DE_AULA(codigo_sala)
);

CREATE TABLE PROF_MINISTRA_AULA(
    codigo_aula INTEGER,
    cpf_prof CHAR(11),
    PRIMARY KEY(codigo_aula),
    FOREIGN KEY(codigo_aula) REFERENCES AULA(codigo_aula),
    FOREIGN KEY(cpf_prof) REFERENCES PROFESSOR(cpf_prof)
);

CREATE TABLE TURMA_DANCA_COREO(
    codigo_turma INTEGER,
    codigo_coreo INTEGER,
    PRIMARY KEY(codigo_turma),
    FOREIGN KEY(codigo_turma) REFERENCES TURMA(codigo_turma),
    FOREIGN KEY(codigo_coreo) REFERENCES COREOGRAFIA(codigo_coreo)
);

CREATE TABLE COREO_TEM_MUSICA(
    codigo_coreo INTEGER,
    nome_musica CHAR(50),
    PRIMARY KEY(codigo_coreo, nome_musica),
    FOREIGN KEY(codigo_coreo) REFERENCES COREOGRAFIA(codigo_coreo),
    FOREIGN KEY(nome_musica) REFERENCES MUSICA(nome_musica)
);

CREATE TABLE COREO_TEM_FIGURINO(
    codigo_coreo INTEGER,
    id_figurino INTEGER,
    PRIMARY KEY(id_figurino),
    FOREIGN KEY(id_figurino) REFERENCES FIGURINO(id_figurino),
    FOREIGN KEY(codigo_coreo) REFERENCES COREOGRAFIA(codigo_coreo)
);

CREATE TABLE FIGURINISTA_FAZ_FIGURINO(
    id_figurino INTEGER,
    cpf_figurinista CHAR(11),
    PRIMARY KEY(id_figurino),
    FOREIGN KEY(id_figurino) REFERENCES FIGURINO(id_figurino),
    FOREIGN KEY(cpf_figurinista) REFERENCES FIGURINISTA(cpf_figurinista)
);

CREATE TABLE COREOGRAFIA_CRIADA(
    cpf_prof CHAR(11),
    cpf_coreo CHAR(11),
    codigo_coreo INTEGER,
    PRIMARY KEY(codigo_coreo),
    FOREIGN KEY(codigo_coreo) REFERENCES COREOGRAFIA(codigo_coreo),
    FOREIGN KEY(cpf_prof) REFERENCES PROFESSOR(cpf_prof),
    FOREIGN KEY(cpf_coreo) REFERENCES COREOGRAFO(cpf_coreo)
);

INSERT INTO ALUNO(id_aluno, nome_aluno, telefone_aluno) VALUES(29033, 'Maria Fernanda', '44991239832');
INSERT INTO ALUNO(id_aluno, nome_aluno, telefone_aluno) VALUES(30042, 'João Pedro', '11987654321');
INSERT INTO ALUNO(id_aluno, nome_aluno, telefone_aluno) VALUES(23764, 'Laura da Silva', '11966540989');
INSERT INTO ALUNO(id_aluno, nome_aluno, telefone_aluno) VALUES(29041, 'Maria Eduarda', '4498934507');
INSERT INTO ALUNO(id_aluno, nome_aluno, telefone_aluno) VALUES(28212, 'Andrea Santos', '4199732651');
INSERT INTO ALUNO(id_aluno, nome_aluno, telefone_aluno) VALUES(25182, 'José Roberto', '1290870775');
INSERT INTO ALUNO(id_aluno, nome_aluno, telefone_aluno) VALUES(29998, 'Pedro Oliveira', '19999892398');
INSERT INTO ALUNO(id_aluno, nome_aluno, telefone_aluno) VALUES(28762, 'Alberto Fernando', '4497760923');
INSERT INTO ALUNO(id_aluno, nome_aluno, telefone_aluno) VALUES(24543, 'Luiza Souza', '4491293343');
INSERT INTO ALUNO(id_aluno, nome_aluno, telefone_aluno) VALUES(30102, 'Emily Borges', '4499675981');
INSERT INTO ALUNO(id_aluno, nome_aluno, telefone_aluno) VALUES(28777, 'Luis Alvaro', '13987894598');

INSERT INTO TURMA(codigo_turma, nivel, ano) VALUES(100, 1, 3);
INSERT INTO TURMA(codigo_turma, nivel, ano) VALUES(101, 1, 1);
INSERT INTO TURMA(codigo_turma, nivel, ano) VALUES(102, 5, 2);
INSERT INTO TURMA(codigo_turma, nivel, ano) VALUES(103, 9, 4);
INSERT INTO TURMA(codigo_turma, nivel, ano) VALUES(112, 8, 6);
INSERT INTO TURMA(codigo_turma, nivel, ano) VALUES(108, 3, 9);
INSERT INTO TURMA(codigo_turma, nivel, ano) VALUES(115, 3, 2);
INSERT INTO TURMA(codigo_turma, nivel, ano) VALUES(111, 1, 3);
INSERT INTO TURMA(codigo_turma, nivel, ano) VALUES(105, 4, 5);
INSERT INTO TURMA(codigo_turma, nivel, ano) VALUES(106, 8, 6);
INSERT INTO TURMA(codigo_turma, nivel, ano) VALUES(113, 10, 7);
INSERT INTO TURMA(codigo_turma, nivel, ano) VALUES(107, 5, 8);

INSERT INTO AULA(codigo_aula, horario, data_aula, estilo_de_dança) VALUES(00431, '15:30', '13/03/2019', 'Ballet Clássico');
INSERT INTO AULA(codigo_aula, horario, data_aula, estilo_de_dança) VALUES(00798, '17:00', '11/07/2019', 'Ballet Clássico');
INSERT INTO AULA(codigo_aula, horario, data_aula, estilo_de_dança) VALUES(01002, '15:30', '28/09/2019', 'Ballet Clássico');
INSERT INTO AULA(codigo_aula, horario, data_aula, estilo_de_dança) VALUES(00298, '19:00', '02/02/2019', 'Ballet Contemporâneo');
INSERT INTO AULA(codigo_aula, horario, data_aula, estilo_de_dança) VALUES(00898, '21:30', '10/08/2019', 'Ballet Contemporâneo');
INSERT INTO AULA(codigo_aula, horario, data_aula, estilo_de_dança) VALUES(00676, '16:30', '25/04/2019', 'Jazz');
INSERT INTO AULA(codigo_aula, horario, data_aula, estilo_de_dança) VALUES(01234, '16:30', '31/11/2019', 'Jazz');
INSERT INTO AULA(codigo_aula, horario, data_aula, estilo_de_dança) VALUES(00598, '17:00', '04/04/2019', 'Jazz');
INSERT INTO AULA(codigo_aula, horario, data_aula, estilo_de_dança) VALUES(00901, '14:30', '12/09/2019', 'Sapateado');
INSERT INTO AULA(codigo_aula, horario, data_aula, estilo_de_dança) VALUES(01104, '15:00', '27/10/2019', 'Sapateado');
INSERT INTO AULA(codigo_aula, horario, data_aula, estilo_de_dança) VALUES(00974, '14:30', '11/07/2019', 'Sapateado');

INSERT INTO SALA_DE_AULA(codigo_sala, andar, bloco) VALUES(001, 1, 'A');
INSERT INTO SALA_DE_AULA(codigo_sala, andar, bloco) VALUES(002, 2, 'A');
INSERT INTO SALA_DE_AULA(codigo_sala, andar, bloco) VALUES(003, 3, 'A');
INSERT INTO SALA_DE_AULA(codigo_sala, andar, bloco) VALUES(010, 1, 'B');
INSERT INTO SALA_DE_AULA(codigo_sala, andar, bloco) VALUES(011, 2, 'B');
INSERT INTO SALA_DE_AULA(codigo_sala, andar, bloco) VALUES(012, 3, 'B');
INSERT INTO SALA_DE_AULA(codigo_sala, andar, bloco) VALUES(100, 1, 'C');
INSERT INTO SALA_DE_AULA(codigo_sala, andar, bloco) VALUES(101, 2, 'C');
INSERT INTO SALA_DE_AULA(codigo_sala, andar, bloco) VALUES(102, 3, 'C');
INSERT INTO SALA_DE_AULA(codigo_sala, andar, bloco) VALUES(103, 4, 'C');

INSERT INTO PROFESSOR(cpf_prof, nome_prof, telefone_prof) VALUES('78702278912', 'Mauri Barateiro Orriça', '44974639875');
INSERT INTO PROFESSOR(cpf_prof, nome_prof, telefone_prof) VALUES('57558622069', 'Dominic Mourinho Palhares', '44940863116');
INSERT INTO PROFESSOR(cpf_prof, nome_prof, telefone_prof) VALUES('22635044007', 'Abraão Vinhas Zarco', '44926752798');
INSERT INTO PROFESSOR(cpf_prof, nome_prof, telefone_prof) VALUES('47172093038', 'Jayson Félix Aldeia', '44954262655');
INSERT INTO PROFESSOR(cpf_prof, nome_prof, telefone_prof) VALUES('60506623041', 'Amélia Viana Severiano', '11926644752');
INSERT INTO PROFESSOR(cpf_prof, nome_prof, telefone_prof) VALUES('18295205048', 'Salvador Boto Boga', '12960452509');
INSERT INTO PROFESSOR(cpf_prof, nome_prof, telefone_prof) VALUES('66267638065', 'Sofia Velasques Manso', '11960840065');
INSERT INTO PROFESSOR(cpf_prof, nome_prof, telefone_prof) VALUES('48387749079', 'Marco Neres Castanho', '13912657837');
INSERT INTO PROFESSOR(cpf_prof, nome_prof, telefone_prof) VALUES('54176551046', 'Sílvia Rosado Maranhão', '41957570810');
INSERT INTO PROFESSOR(cpf_prof, nome_prof, telefone_prof) VALUES('27926668036', 'Lurdes Arouca Varanda', '41929179435');

INSERT INTO COREOGRAFO(cpf_coreo, nome_coreo, telefone_coreo) VALUES('16237790063', 'Iago Castanheira Pegado', '11934299315');
INSERT INTO COREOGRAFO(cpf_coreo, nome_coreo, telefone_coreo) VALUES('45485681077', 'Mellyssa Lacerda Vaz', '11975258060');
INSERT INTO COREOGRAFO(cpf_coreo, nome_coreo, telefone_coreo) VALUES('62452128040', 'Geovanna Vilhena Goulart', '11953298661');
INSERT INTO COREOGRAFO(cpf_coreo, nome_coreo, telefone_coreo) VALUES('15017874038', 'Jil Tedim Farinha', '21952300007');
INSERT INTO COREOGRAFO(cpf_coreo, nome_coreo, telefone_coreo) VALUES('54175044086', 'Anastacia Leal Brito', '22924952225');
INSERT INTO COREOGRAFO(cpf_coreo, nome_coreo, telefone_coreo) VALUES('09349743060', 'Kamila Severo Rocha', '44935031504');
INSERT INTO COREOGRAFO(cpf_coreo, nome_coreo, telefone_coreo) VALUES('16759043081', 'Duarte Bencatel Semedo', '44972580383');
INSERT INTO COREOGRAFO(cpf_coreo, nome_coreo, telefone_coreo) VALUES('17579811014', 'Martin Aranha Bacelar', '41979622160');
INSERT INTO COREOGRAFO(cpf_coreo, nome_coreo, telefone_coreo) VALUES('97269392080', 'Renata Ferraço Prada', '44939302626');
INSERT INTO COREOGRAFO(cpf_coreo, nome_coreo, telefone_coreo) VALUES('77136768055', 'Layra Lobato Girão', '44978506452');

INSERT INTO COREOGRAFIA(codigo_coreo, tema, duracao_coreo) VALUES(9846, 'Flores', '6:12');
INSERT INTO COREOGRAFIA(codigo_coreo, tema, duracao_coreo) VALUES(9941, 'Baile', '10:11');
INSERT INTO COREOGRAFIA(codigo_coreo, tema, duracao_coreo) VALUES(1172, 'Neve', '3:32');
INSERT INTO COREOGRAFIA(codigo_coreo, tema, duracao_coreo) VALUES(7094, 'Banda', '3:50');
INSERT INTO COREOGRAFIA(codigo_coreo, tema, duracao_coreo) VALUES(4131, 'Brasil', '3:46');
INSERT INTO COREOGRAFIA(codigo_coreo, tema, duracao_coreo) VALUES(4146, 'Xadrez', '6:59');
INSERT INTO COREOGRAFIA(codigo_coreo, tema, duracao_coreo) VALUES(4552, 'Sete Anões', '8:03');
INSERT INTO COREOGRAFIA(codigo_coreo, tema, duracao_coreo) VALUES(5092, 'Los Angeles', '8:41');
INSERT INTO COREOGRAFIA(codigo_coreo, tema, duracao_coreo) VALUES(5526, 'Cozinheiros', '8:58');
INSERT INTO COREOGRAFIA(codigo_coreo, tema, duracao_coreo) VALUES(9526, 'Cisne', '12:01');

INSERT INTO MUSICA(nome_musica, artista, duracao_musica, estilo_musica) VALUES('Eine kleine Nachtmusik', 'Mozart', '18:55', 'Clássica');
INSERT INTO MUSICA(nome_musica, artista, duracao_musica, estilo_musica) VALUES('Toccata and Fugue in D minor', 'J. S. Bach', '9:32', 'Clássica');
INSERT INTO MUSICA(nome_musica, artista, duracao_musica, estilo_musica) VALUES('Symphony No.5 in C minor', 'Beethoven', '4:28', 'Clássica');
INSERT INTO MUSICA(nome_musica, artista, duracao_musica, estilo_musica) VALUES('Boléro', 'Ravel', '8:32', 'Clássica');
INSERT INTO MUSICA(nome_musica, artista, duracao_musica, estilo_musica) VALUES('Poker Face', 'Lady Gaga', '3:34', 'Pop');
INSERT INTO MUSICA(nome_musica, artista, duracao_musica, estilo_musica) VALUES('Part of Me', 'Katy Perry', '3:40', 'Pop');
INSERT INTO MUSICA(nome_musica, artista, duracao_musica, estilo_musica) VALUES('Dear Mama', '2Pac', '4:12', 'HipHop');
INSERT INTO MUSICA(nome_musica, artista, duracao_musica, estilo_musica) VALUES('O Leãozinho', 'Caetano Veloso', '2:50', 'MPB');
INSERT INTO MUSICA(nome_musica, artista, duracao_musica, estilo_musica) VALUES('Voltei, Recife', 'Alceu Valença', '3:20', 'Axé');
INSERT INTO MUSICA(nome_musica, artista, duracao_musica, estilo_musica) VALUES('Dance of the Knights', 'Prokofiev', '5:29', 'Clássica');

INSERT INTO FIGURINO(id_figurino, cor, estilo_figurino) VALUES(2211, 'Roxo', 'Tutu');
INSERT INTO FIGURINO(id_figurino, cor, estilo_figurino) VALUES(8140, 'Laranja e Vermelho', 'Esportivo');
INSERT INTO FIGURINO(id_figurino, cor, estilo_figurino) VALUES(3977, 'Azul e Branco', 'Tutu');
INSERT INTO FIGURINO(id_figurino, cor, estilo_figurino) VALUES(8573, 'Rosa', 'Esportivo');
INSERT INTO FIGURINO(id_figurino, cor, estilo_figurino) VALUES(5663, 'Preto', 'Moderno');
INSERT INTO FIGURINO(id_figurino, cor, estilo_figurino) VALUES(6780, 'Amarelo e preto', 'Moderno');
INSERT INTO FIGURINO(id_figurino, cor, estilo_figurino) VALUES(1483, 'Azul', 'Saia longa');
INSERT INTO FIGURINO(id_figurino, cor, estilo_figurino) VALUES(1120, 'Roxo', 'Vestido longo');
INSERT INTO FIGURINO(id_figurino, cor, estilo_figurino) VALUES(5847, 'Roxo, rosa e lilás', 'Vestido tubo');
INSERT INTO FIGURINO(id_figurino, cor, estilo_figurino) VALUES(7940, 'Dourado', 'Esportivo');

INSERT INTO FIGURINISTA(cpf_figurinista, nome_figurinista, telefone_figurinista) VALUES('40800365070', 'Nicola Casalinho Vila-Chã', '44973956708');
INSERT INTO FIGURINISTA(cpf_figurinista, nome_figurinista, telefone_figurinista) VALUES('61367909040', 'Laysla Bezerril Pimentel', '44970065275');
INSERT INTO FIGURINISTA(cpf_figurinista, nome_figurinista, telefone_figurinista) VALUES('70541257030', 'Ícaro Marques Homem', '44915466406');
INSERT INTO FIGURINISTA(cpf_figurinista, nome_figurinista, telefone_figurinista) VALUES('90008560005', 'Danilo Canhão Vasconcelos', '44978203280');
INSERT INTO FIGURINISTA(cpf_figurinista, nome_figurinista, telefone_figurinista) VALUES('95237179010', 'Hermano Silvestre Rijo', '41946372639');
INSERT INTO FIGURINISTA(cpf_figurinista, nome_figurinista, telefone_figurinista) VALUES('20210649054', 'Lidiana Quintais Torquato', '41993940679');
INSERT INTO FIGURINISTA(cpf_figurinista, nome_figurinista, telefone_figurinista) VALUES('16337087054', 'Jóni Mata Aveiro', '11932183406');
INSERT INTO FIGURINISTA(cpf_figurinista, nome_figurinista, telefone_figurinista) VALUES('24126903089', 'Ágata Borges Peseiro', '11964836550');
INSERT INTO FIGURINISTA(cpf_figurinista, nome_figurinista, telefone_figurinista) VALUES('22197250060', 'Ezra Maior Uchoa', '11957079978');
INSERT INTO FIGURINISTA(cpf_figurinista, nome_figurinista, telefone_figurinista) VALUES('55676296054', 'Nikolas Filgueiras Outeiro', '11939357497');
