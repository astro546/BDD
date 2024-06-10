--
-- ER/Studio 8.0 SQL Code Generation
-- Company :      UNAM
-- Project :      AUTOS-ARCBD_S1.DM1
-- Author :       Jorge
--
-- Date Created : Monday, April 20, 2020 16:32:19
-- Target DBMS : Oracle 11g
--

-- 
-- TABLE: F_ARC_CLIENTE_1 
--

CREATE TABLE F_ARC_CLIENTE_1(
    CLIENTE_ID     NUMBER(10, 0)    NOT NULL,
    NUM_TARJETA    VARCHAR2(16),
    CONSTRAINT F_ARC_CLIENTE_1_PK PRIMARY KEY (CLIENTE_ID)
)
;



-- 
-- TABLE: F_ARC_CLIENTE_3 
--

CREATE TABLE F_ARC_CLIENTE_3(
    CLIENTE_ID            NUMBER(10, 0)    NOT NULL,
    NOMBRE                VARCHAR2(40)     NOT NULL,
    AP_PATERNO            VARCHAR2(40)     NOT NULL,
    AP_MATERNO            VARCHAR2(40),
    NUM_IDENTIFICACION    VARCHAR2(18)     NOT NULL,
    EMAIL                 VARCHAR2(500)    NOT NULL,
    CONSTRAINT F_ARC_CLIENTE_3_PK PRIMARY KEY (CLIENTE_ID)
)
;



