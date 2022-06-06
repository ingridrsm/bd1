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
