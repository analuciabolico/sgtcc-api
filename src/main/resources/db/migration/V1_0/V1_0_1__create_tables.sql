CREATE TABLE ALUNOS
(
    ID NUMBER CONSTRAINT PK_ALUNO PRIMARY KEY,
    CPF VARCHAR2(11) UNIQUE NOT NULL,
    EMAIL VARCHAR2(100) NOT NULL,
    MATRICULA VARCHAR2(20) UNIQUE NOT NULL,
    NOME VARCHAR2(200) NOT NULL,
    TELEFONE VARCHAR2(15) NOT NULL
);
CREATE TABLE AREAS_INTERESSE
(
    ID NUMBER CONSTRAINT PK_AREA_INTERESSE PRIMARY KEY,
    NAME VARCHAR2(200) UNIQUE NOT NULL,
    DESCRICAO VARCHAR2(200) NOT NULL
);
CREATE TABLE AREAS_INTERESSE_PROFESSORES
(
    FK_AREA_INTERESSE_UID NUMBER NOT NULL,
    FK_PROFESSOR_UID NUMBER NOT NULL
);
CREATE TABLE AVALIACOES
(
    ID NUMBER CONSTRAINT PK_AVALIACAO PRIMARY KEY,
    APRESENTACAO VARCHAR2(255) NOT NULL,
    APROVADO NUMBER(1) NOT NULL,
    CONTEUDO_TEXTO VARCHAR2(255) NOT NULL,
    ESTRUTURA_TEXTO VARCHAR2(255) NOT NULL,
    LINGUAGEM VARCHAR2(255) NOT NULL,
    OBSERVACAO VARCHAR2(255),
    RELEVANCIA VARCHAR2(255) NOT NULL,
    TITULO VARCHAR2(255) NOT NULL,
    NOTA NUMBER NOT NULL,
    TIPO VARCHAR2(255) NOT NULL,
    FK_PROPOSTA_UID NUMBER NOT NULL,
    FK_PROFESSOR_UID NUMBER NOT NULL
);
CREATE TABLE BANCAS
(
    ID NUMBER CONSTRAINT PK_BANCA PRIMARY KEY,
    DATA_CRIACAO TIMESTAMP NOT NULL,
    DATA TIMESTAMP NOT NULL,
    FK_TURMA_UID NUMBER NOT NULL,
    FK_ORIENTADOR_UID NUMBER NOT NULL,
    FK_PROPOSTA_UID NUMBER NOT NULL
);
CREATE TABLE BANCAS_AVALIADORES
(
    FK_BANCA_UID NUMBER NOT NULL,
    FK_AVALIADOR_UID NUMBER NOT NULL
);
CREATE TABLE TURMAS
(
    ID NUMBER CONSTRAINT PK_TURMA PRIMARY KEY,
    NAME VARCHAR2(255) NOT NULL,
    FK_PROFESSOR_UID NUMBER NOT NULL,
    FK_SEMESTRE_UID NUMBER NOT NULL
);
CREATE TABLE TURMAS_ALUNOS
(
    FK_ALUNO_UID NUMBER NOT NULL,
    FK_TURMA_UID NUMBER NOT NULL
);
CREATE TABLE SEMESTRES
(
    ID NUMBER CONSTRAINT PK_SEMESTRE PRIMARY KEY,
    NAME VARCHAR2(6) NOT NULL
);
CREATE TABLE PROFESSORES
(
    ID NUMBER CONSTRAINT PK_PROFESSOR PRIMARY KEY,
    CPF VARCHAR2(11) UNIQUE NOT NULL,
    EMAIL VARCHAR2(100) NOT NULL,
    MATRICULA VARCHAR2(20) UNIQUE NOT NULL,
    NOME VARCHAR2(200) NOT NULL,
    TELEFONE VARCHAR2(15) NOT NULL,
    FK_TITULO_UID NUMBER NOT NULL
);
CREATE TABLE PROPOSTAS
(
    ID NUMBER CONSTRAINT PK_PROPOSTA PRIMARY KEY,
    TITULO VARCHAR2(255) NOT NULL,
    FK_AUTOR_UID NUMBER NOT NULL,
    FK_ORIENTADOR_UID NUMBER NOT NULL
);
CREATE TABLE SUGESTOES
(
    ID NUMBER CONSTRAINT PK_SUGESTAO PRIMARY KEY,
    DESCRICAO VARCHAR2(255) NOT NULL,
    PESQUISA NUMBER(1) NOT NULL,
    TITULO VARCHAR2(255) NOT NULL,
    FK_PROFESSOR_UID NUMBER NOT NULL
);
CREATE TABLE TITULOS
(
    ID NUMBER CONSTRAINT PK_TITULO PRIMARY KEY,
    DESCRICAO VARCHAR2(255) NOT NULL,
    NOMECLATURA VARCHAR2(255) NOT NULL,
    TIPO VARCHAR2(255) NOT NULL
);
