-----------------------------------------------------------------------------
-------------           CONSULTAS COM GROUP BY / HAVING         -------------
-----------------------------------------------------------------------------

-- LISTAR O NÚMERO DE JOGADORES CONVOCADOS POR SELEÇÃO PARA CADA COPA DO MUNDO.
SELECT COPA_ANO, SELECAO_COD, COUNT(JOGADOR_ID) AS NUMERO_JOGADORES
FROM JOGADOR_CONVOCADO
GROUP BY COPA_ANO, SELECAO_COD;

-- LISTAR O NOME DOS ESTÁDIOS E O NÚMERO DE PARTIDAS REALIZADAS EM CADA UM, 
-- APENAS PARA ESTÁDIOS COM PELO MENOS 2 PARTIDAS REALIZADAS.
SELECT ESTADIO_NOME, COUNT(*) AS NUM_PARTIDAS
FROM PARTIDA
GROUP BY ESTADIO_NOME
HAVING COUNT(*) >= 2;

-- LISTAR OS IDS DOS JOGADORES QUE FORAM CONVOCADOS PARA MAIS DE 2 COPAS.
SELECT JOGADOR_ID, COUNT(*) AS NUM_COPAS
FROM JOGADOR_CONVOCADO
GROUP BY JOGADOR_ID
HAVING COUNT(*) > 2;


-----------------------------------------------------------------------------
-------------            CONSULTAS COM JUNÇÃO INTERNA           -------------
-----------------------------------------------------------------------------

-- LISTAR O NOME DOS TÉCNICOS QUE PARTICIPARAM DE PELO MENOS DUAS COPAS DO MUNDO
-- E O CÓDIGO DA SELEÇÃO QUE ELE TREINOU.
SELECT T.NOME, P.SELECAO_COD
FROM TECNICO T INNER JOIN PARTICIPA P ON T.ID_FIFA = P.TECNICO_ID
GROUP BY T.NOME, P.SELECAO_COD
HAVING COUNT(*) >= 2;

-- LISTAR O ID DAS SELEÇÕES QUE VENCEREAM MAIS DO QUE 2 COPAS E QUANTAS COPAS
-- ESSA SELEÇÃO VENCEU.
SELECT S.CODIGO, COUNT(*) AS TITULOS
FROM SELECAO S INNER JOIN PARTICIPA P ON S.CODIGO = P.SELECAO_COD
WHERE P.COLOCACAO = 1
GROUP BY S.CODIGO
HAVING COUNT(*) >= 2;

-- LISTAR OS CNPJS DOS PATROCINADORES QUE PATROCINARAM MAIS DE 2 SELEÇÕES.
SELECT PT.PATROCINADOR_CNPJ, COUNT(*) AS NUM_SELECOES
FROM PATROCINIO PT INNER JOIN SELECAO S ON PT.SELECAO_COD = S.CODIGO
GROUP BY PT.PATROCINADOR_CNPJ
HAVING COUNT(*) > 2;


-----------------------------------------------------------------------------
-------------           CONSULTAS COM JUNÇÃO EXTERNA            -------------
-----------------------------------------------------------------------------

-- SELECIONAR OS CODIGOS DAS SELEÇÕES E OS CNPJS DO PATROCINADORES QUE AS 
-- PATROCINARAM NA COPA DE 2014, MESMO QUE NÃO HAJA PATROCINADOR.
SELECT S.CODIGO, PT.PATROCINADOR_CNPJ
FROM SELECAO S LEFT OUTER JOIN PATROCINIO PT ON S.CODIGO = PT.SELECAO_COD AND PT.COPA_ANO = '2014';

-- LISTAR O NOME DOS TECNICOS QUE NUNCA TREINARAM SELEÇÕES EM COPAS.
SELECT T.NOME
FROM  PARTICIPA P RIGHT OUTER JOIN TECNICO T ON P.TECNICO_ID = T.ID_FIFA
WHERE P.TECNICO_ID IS NULL;


-----------------------------------------------------------------------------
-------------            CONSULTAS COM SEMI-JUNÇÃO              -------------  
-----------------------------------------------------------------------------

-- LISTAR OS NOMES DOS ESTADIOS EM QUE HOUVE TREINAMENTO.
SELECT E.NOME
FROM ESTADIO E
WHERE EXISTS (SELECT * 
              FROM TREINAMENTO T
              WHERE T.ESTADIO_NOME = E.NOME);

-- LISTAR OS NOMES DOS ESTADIOS QUE SEDIARAM FINAIS DE COPAS.
SELECT E.NOME
FROM ESTADIO E
WHERE E.NOME IN (SELECT P.ESTADIO_NOME
                FROM PARTIDA P
                WHERE P.FASE = 'final');

-- LISTAR O NOME E A FUNCAO DOS JOGADORES QUE PARTICIPARAM DE PELO 
-- MENOS DUAS COPAS.
SELECT J.NOME, J.FUNCAO
FROM JOGADOR J
WHERE J.ID_FIFA IN (SELECT JC.JOGADOR_ID
                    FROM JOGADOR_CONVOCADO JC
                    GROUP BY JC.JOGADOR_ID
                    HAVING COUNT(*) >= 2);


-----------------------------------------------------------------------------
-------------             CONSULTAS COM ANTI-JUNÇÃO             -------------
-----------------------------------------------------------------------------

-- LISTAR O NOME DOS ESTADIOS EM QUE NÃO HOUVE TREINAMENTO.
SELECT E.NOME
FROM ESTADIO E
WHERE NOT EXISTS (SELECT * 
                  FROM TREINAMENTO T
                  WHERE T.ESTADIO_NOME = E.NOME);

-- LISTAR OS CODIGOS DAS SELEÇÕES QUE NÃO FORAM PATROCINADAS POR NENHUM PATROCINADOR.
SELECT S.CODIGO
FROM SELECAO S
WHERE NOT EXISTS (SELECT * 
                  FROM PATROCINIO P
                  WHERE P.SELECAO_COD = S.CODIGO);


-----------------------------------------------------------------------------
-------------    CONSULTAS COM SUBCONSULTAS DO TIPO ESCALAR     -------------
-----------------------------------------------------------------------------

-- LISTAR OS NOMES DOS JOGADORES COM MAIOR SALARIO.
SELECT J.NOME
FROM JOGADOR J
WHERE J.SALARIO = (SELECT MAX(J2.SALARIO)
                   FROM JOGADOR J2);

-- LISTAR OS CODIGOS DAS SELEÇÕES QUE VENCERAM MAIS COPAS.
SELECT P.SELECAO_COD
FROM PARTICIPA P
WHERE P.COLOCACAO = 1
GROUP BY P.SELECAO_COD
HAVING COUNT(*) = (SELECT MAX(NUM_VITORIAS)
                   FROM (SELECT COUNT(*) AS NUM_VITORIAS
                         FROM PARTICIPA P2
                         WHERE P2.COLOCACAO = 1
                         GROUP BY P2.SELECAO_COD));

-----------------------------------------------------------------------------
-------------      CONSULTAS COM SUBCONSULTAS DO TIPO LINHA     -------------
-----------------------------------------------------------------------------

-- LISTAR O NOME DOS JOGADORES QUE ATUAM NA MESMA FUNÇÃO E RECEBEM O MESMO
-- SALARIO QUE O JOGADOR DE ID_FIFA `0076`.
SELECT J.NOME
FROM JOGADOR J
WHERE (J.FUNCAO, J.SALARIO) = (SELECT J2.FUNCAO, J2.SALARIO
                                FROM JOGADOR J2
                                WHERE J2.ID_FIFA = '0076');

-- LISTAR O NOME DOS ESTADIOS QUE SÃO LOCALIZADOS NA MESMA CIDADE E NA MESMA RUA
-- DO ESTÁDIO QUE SEDIOU A FINAL DA COPA DE 2014.
SELECT E.NOME
FROM ESTADIO E
WHERE (E.END_CIDADE, E.END_RUA) = (SELECT E2.END_CIDADE, E2.END_RUA
                                  FROM ESTADIO E2
                                  WHERE E2.NOME = (SELECT P.ESTADIO_NOME
                                                  FROM PARTIDA P
                                                  WHERE P.FASE = 'final' AND P.COPA_ANO = '2014'));

-----------------------------------------------------------------------------
------------- CONSULTAS COM SUBCONSULTAS DO TIPO TABELA         -------------
-----------------------------------------------------------------------------

-- LISTAR O NOME DOS JOGADORES QUE TREINARAM EM MAIS DE 2 ESTADIOS. 
SELECT J.NOME
FROM JOGADOR J
WHERE J.ID_FIFA IN (SELECT T.JOGADOR_ID
                    FROM TREINAMENTO T
                    GROUP BY T.JOGADOR_ID
                    HAVING COUNT(*) > 2);

-- LISTAR O CODIGO E OS UNIFORMES DAS SELEÇÕES QUE PARTICIPARAM DE MENOS COPAS 
-- DO QUE A MÉDIA.
SELECT S.CODIGO, S.UNIFORME_PRINCIPAL, S.UNIFORME_SECUNDARIO
FROM SELECAO S
WHERE S.CODIGO IN (SELECT P.SELECAO_COD
                   FROM PARTICIPA P
                   GROUP BY P.SELECAO_COD
                   HAVING COUNT(*) < (SELECT AVG(NUM_COPAS)
                                      FROM (SELECT COUNT(*) AS NUM_COPAS
                                            FROM PARTICIPA P2
                                            GROUP BY P2.SELECAO_COD)));

-----------------------------------------------------------------------------
-------------      CONSULTAS COM OPERAÇÃO DE CONJUNTO           -------------
-----------------------------------------------------------------------------

-- LISTAR O NOME DE TODAS AS PESSOAS CADASTRADAS (TREINADORES + JOGADORES).
SELECT T.NOME
FROM TECNICO T UNION (SELECT J.NOME FROM JOGADOR J);

-- LISTAR O CODIGO DAS SELEÇÕES QUE PARTICIPARAM DA COPA DE 2014 E DA COPA DE 2018.
SELECT P.SELECAO_COD
FROM PARTICIPA P
WHERE P.COPA_ANO = '2014' INTERSECT
SELECT P2.SELECAO_COD
FROM PARTICIPA P2
WHERE P2.COPA_ANO = '2018';

-----------------------------------------------------------------------------
-------------                      PL/SQL                       -------------
-----------------------------------------------------------------------------

-- IMPEDE CONVOCAR MAIS DE 23 JOGADORES POR SELEÇÃO EM UMA COPA.
CREATE OR REPLACE TRIGGER LIMITE_JOGADORES
BEFORE INSERT OR UPDATE ON JOGADOR_CONVOCADO
FOR EACH ROW
DECLARE
  QTDE_JOGADORES INTEGER;
BEGIN
  SELECT COUNT(*) INTO QTDE_JOGADORES
  FROM JOGADOR_CONVOCADO
  WHERE SELECAO_COD = :NEW.SELECAO_COD
  AND COPA_ANO = :NEW.COPA_ANO;

  IF QTDE_JOGADORES >= 23 THEN
    RAISE_APPLICATION_ERROR(-20000, 'Seleção já possui 23 jogadores convocados!');
  END IF;
END;
/

-- NÃO É POSSÍVEL ADICIONAR UM 24o JOGADOR.
INSERT INTO JOGADOR_CONVOCADO (JOGADOR_ID, SELECAO_COD, COPA_ANO) VALUES ('9012', 'BRA', '2014');
    
-- IMPEDE INSERT DE TECNICO QUE JA FOI JOGADOR.
CREATE OR REPLACE TRIGGER VERIFICAR_TECNICO_JOGADOR 
BEFORE INSERT ON TECNICO
FOR EACH ROW
DECLARE
    ID_JOGADOR VARCHAR(4);
BEGIN
    BEGIN
        SELECT ID_FIFA INTO ID_JOGADOR FROM JOGADOR WHERE ID_FIFA = :NEW.ID_FIFA;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            ID_JOGADOR := NULL;
    END;

    IF ID_JOGADOR IS NOT NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'Não é possível adicionar um técnico que já foi jogador.');
    END IF;
END;
/

-- NÃO É POSSÍVEL ADICIONAR UM TECNICO QUE JA FOI JOGADOR.
INSERT INTO TECNICO (ID_FIFA, SALARIO, NOME) VALUES ('0009', 150000.00, 'Ronaldinho');

-- IMPEDE INSERT DE JOGADOR QUE JA FOI TECNICO.
CREATE OR REPLACE TRIGGER VERIFICAR_JOGADOR_TECNICO
BEFORE INSERT ON JOGADOR
FOR EACH ROW
DECLARE
    ID_TECNICO VARCHAR(4);
BEGIN
    BEGIN
        SELECT ID_FIFA INTO ID_TECNICO FROM TECNICO WHERE ID_FIFA = :NEW.ID_FIFA;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            ID_TECNICO := NULL;
    END;

    IF ID_TECNICO IS NOT NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'Não é possível adicionar um jogador que já foi técnico.');
    END IF;
END;
/

-- NÃO É POSSÍVEL ADICIONAR UM JOGADOR QUE JA FOI TECNICO.
INSERT INTO JOGADOR(ID_FIFA, SALARIO, NOME, FUNCAO) VALUES ('0001', 150000.00, 'João Silva', 'Atacante');

-- LISTA TODAS AS SELEÇÕES QUE PARTICIPARAM DA COPA EM UM DETERMINADO ANO.
CREATE OR REPLACE PROCEDURE SELECAO_POR_COPA_ANO (ANO VARCHAR) IS
    CURSOR CUR_SELECAO_COPA_COD IS 
    SELECT P.SELECAO_COD
    FROM PARTICIPA P
    WHERE COPA_ANO = ANO;
BEGIN
    dbms_output.put_line('Seleções que participaram da Copa de ' || ANO);
    FOR COD IN CUR_SELECAO_COPA_COD LOOP
        dbms_output.put_line(COD.SELECAO_COD);
    END LOOP;
END;
/

BEGIN
    SELECAO_POR_COPA_ANO('2014');
END;
/
BEGIN
    SELECAO_POR_COPA_ANO('2018');
END;
/

-- LISTA OS CODIGOS DAS SELEÇÕES QUE PARTICIPARAM DE FINAIS DE COPA.
CREATE OR REPLACE PROCEDURE SELECOES_POR_FASE (WHICH_FASE VARCHAR) IS
    CURSOR CUR_SELECAO_FASE_COD IS 
    SELECT DISTINCT SELECAO_COD FROM (
        SELECT P.SELECAO_MANDANTE_COD AS SELECAO_COD FROM PARTIDA P WHERE P.FASE = WHICH_FASE
        UNION ALL
        SELECT P.SELECAO_VISITANTE_COD AS SELECAO_COD FROM PARTIDA P WHERE P.FASE = WHICH_FASE
    );
BEGIN
    dbms_output.put_line('Seleções que jogaram ' || WHICH_FASE ||  ' de Copa.');
    FOR COD IN CUR_SELECAO_FASE_COD LOOP
        dbms_output.put_line(COD.SELECAO_COD);
    END LOOP;
END;
/

BEGIN
    SELECOES_POR_FASE('final');
END;
/

-- LISTA OS CODIGOS DAS SELEÇÕES E OS CNPJS DO PATROCINADORES QUE AS 
-- PATROCINARAM EM DETERMINADA COPA, MESMO QUE NÃO HAJA PATROCINADOR.
CREATE OR REPLACE PROCEDURE PATROCINIO_POR_SELECAO_EM_COPA (COPA VARCHAR) IS
    CURSOR CUR_PATROCINIO_SELECAO_EM_COPA IS 
    SELECT S.CODIGO, PT.PATROCINADOR_CNPJ
    FROM SELECAO S LEFT OUTER JOIN PATROCINIO PT ON S.CODIGO = PT.SELECAO_COD AND PT.COPA_ANO = COPA;
BEGIN
    dbms_output.put_line('Patrocinadores por seleção na Copa de ' || COPA);
    FOR PATROCINIO IN CUR_PATROCINIO_SELECAO_EM_COPA LOOP
        dbms_output.put_line(PATROCINIO.CODIGO || ' <- ' || PATROCINIO.PATROCINADOR_CNPJ);
    END LOOP;
END;
/

BEGIN
    PATROCINIO_POR_SELECAO_EM_COPA('2014');
END;
/

-- INDICA SE UMA SELEÇAO JA FOI CAMPEA DA COPA DO MUNDO.
CREATE OR REPLACE FUNCTION SELECAO_FOI_CAMPEA(DESIRED_SELECAO_COD VARCHAR) RETURN VARCHAR2 IS
    QTD_TITULOS NUMBER;
BEGIN
    SELECT COUNT(*) INTO QTD_TITULOS
    FROM PARTICIPA
    WHERE SELECAO_COD = DESIRED_SELECAO_COD AND COLOCACAO = 1;

    IF QTD_TITULOS > 0 THEN
        RETURN 'Sim';
    ELSE
        RETURN 'Não';
    END IF;
END;
/

SELECT SELECAO_FOI_CAMPEA('BRA') FROM DUAL;
SELECT SELECAO_FOI_CAMPEA('HOL') FROM DUAL;
