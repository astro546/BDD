--
-- ER/Studio 8.0 SQL Code Generation
-- Company :      UNAM
-- Project :      AUTOS-ARCBD_S2.DM1
-- Author :       Jorge
--
-- Date Created : Monday, April 20, 2020 16:35:03
-- Target DBMS : Oracle 11g
--

-- 
-- TABLE: F_ARC_AUTO_2 
--

CREATE TABLE F_ARC_AUTO_2(
    AUTO_ID       NUMBER(10, 0)    NOT NULL,
    MARCA         VARCHAR2(40)     NOT NULL,
    MODELO        VARCHAR2(40)     NOT NULL,
    ANIO          NUMBER(4, 0)     NOT NULL,
    NUM_SERIE     VARCHAR2(20)     NOT NULL,
    TIPO          CHAR(1)          NOT NULL,
    DESCUENTO     NUMBER(9, 2),
    AGENCIA_ID    NUMBER(10, 0)    NOT NULL,
    CLIENTE_ID    NUMBER(10, 0),
    CONSTRAINT F_ARC_AUTO_2_PK PRIMARY KEY (AUTO_ID)
)
;



-- 
-- TABLE: F_ARC_AUTO_CARGA_1 
--

CREATE TABLE F_ARC_AUTO_CARGA_1(
    AUTO_ID             NUMBER(10, 0)    NOT NULL,
    PESO_MAXIMO         NUMBER(10, 2)    NOT NULL,
    VOLUMEN             NUMBER(10, 2)    NOT NULL,
    TIPO_COMBUSTIBLE    CHAR(1)          NOT NULL,
    CONSTRAINT F_ARC_AUTO_CARGA_1_PK PRIMARY KEY (AUTO_ID), 
    CONSTRAINT AUTO_CARGA_1_AUTO_2_ID_FK FOREIGN KEY (AUTO_ID)
    REFERENCES F_ARC_AUTO_2(AUTO_ID)
)
;



-- 
-- TABLE: F_ARC_CLIENTE_2 
--

CREATE TABLE F_ARC_CLIENTE_2(
    CLIENTE_ID            NUMBER(10, 0)    NOT NULL,
    NOMBRE                VARCHAR2(40)     NOT NULL,
    AP_PATERNO            VARCHAR2(40)     NOT NULL,
    AP_MATERNO            VARCHAR2(40),
    NUM_IDENTIFICACION    VARCHAR2(18)     NOT NULL,
    EMAIL                 VARCHAR2(500)    NOT NULL,
    CONSTRAINT F_ARC_CLIENTE_2_PK PRIMARY KEY (CLIENTE_ID)
)
;



