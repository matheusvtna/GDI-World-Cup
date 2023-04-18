-----------------------------------------------------------------------------
-------------           CONSULTAS COM GROUP BY / HAVING         -------------
-----------------------------------------------------------------------------

-- LISTAR O NÚMERO DE JOGADORES CONVOCADOS POR SELEÇÃO PARA CADA COPA DO MUNDO.
SELECT COPA_ANO, SELECAO_COD, COUNT(JOGADOR_ID) AS NUMERO_JOGADORES
FROM JOGADOR_CONVOCADO
GROUP BY COPA_ANO, SELECAO_COD;

-- LISTAR O NOME DOS ESTÁDIOS E O NÚMERO DE PARTIDAS REALIZADAS EM CADA UM, 
-- APENAS PARA ESTÁDIOS COM PELO MENOS 10 PARTIDAS REALIZADAS.
SELECT ESTADIO_NOME, COUNT(*) AS NUM_PARTIDAS
FROM PARTIDA
GROUP BY ESTADIO_NOME
HAVING COUNT(*) >= 10;

-- LISTAR OS IDS DOS JOGADORES QUE FORAM CONVOCADOS PARA MAIS DE 2 COPAS.
SELECT JOGADOR_ID, COUNT(*) AS NUM_COPAS
FROM JOGADOR_CONVOCADO
GROUP BY JOGADOR_ID
HAVING COUNT(*) > 2;


-----------------------------------------------------------------------------
-------------            CONSULTAS COM JUNÇÃO INTERNA           -------------
-----------------------------------------------------------------------------

-- LISTAR O NOME DOS TÉCNICOS QUE PARTICIPARAM DE PELO MENOS DUAS COPAS DO MUNDO.
SELECT T.NOME
FROM TECNICO T INNER JOIN PARTICIPA P ON T.ID_FIFA = P.TECNICO_ID
GROUP BY T.NOME
HAVING COUNT(DISTINCT P.COPA_ANO) >= 2;

-- LISTAR O ID DAS SELEÇÕES QUE VENCEREAM MAIS DO QUE 2 COPAS E QUANTAS COPAS
-- ESSA CADA SELEÇÃO VENCEU.
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
-- PATROCINARAM EM DETERMINADA COPA.
-- Acho que poderiamos usar as paradas de PL/SQL aqui pra fazer uma function 
-- que retorna. (Não tenho certeza se é assim que funciona mesmo...)
SELECT S.CODIGO, PT.PATROCINADOR_CNPJ
FROM SELECAO S LEFT OUTER JOIN PATROCINIO PT ON S.CODIGO = PT.SELECAO_COD AND PT.COPA_ANO = '2014';

-- LISTAR OS IDS DAS FEDERACOES QUE SÃO DIRIGIDAS POR OUTRAS FEDERACOES.
SELECT DISTINCT F.ID
FROM FEDERACAO F LEFT OUTER JOIN FEDERACAO F2 ON F.ID = F2.DIRIGENTE_ID
WHERE F2.ID IS NULL;

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
                WHERE P.ESTADIO_NOME = E.NOME AND P.FASE = 'FINAL');

-- LISTAR AS FUNCOES DOS JOGADORES QUE PARTICIPARAM DE PELO MENOS DUAS COPAS.
SELECT J.FUNCAO
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

-- LISTAR O NOME DOS JOGADORES QUE NÃO PARTICIPARAM DE NENHUMA COPA DO MUNDO.
SELECT T.NOME
FROM TECNICO T
WHERE NOT EXISTS (SELECT * 
                  FROM PARTICIPA P
                  WHERE P.TECNICO_ID = T.ID_FIFA);

-- LISTAR OS CODIGOS DAS SELEÇÕES QUE NÃO FORAM PATROCINADAS POR NENHUM PATROCINADOR.
SELECT S.CODIGO
FROM SELECAO S
WHERE NOT EXISTS (SELECT * 
                  FROM PATROCINIO P
                  WHERE P.SELECAO_COD = S.CODIGO);


-----------------------------------------------------------------------------
-------------    CONSULTAS COM SUBCONSULTAS DO TIPO ESCALAR     -------------
-----------------------------------------------------------------------------

-- NUMERO DE ESTADIOS CUJO NOME COMEÇA COM A LETRA ‘M’.
SELECT SUM(NUM_ESTADIOS_M) AS ESTADIOS_QUE_INICIAM_COM_M
FROM (SELECT COUNT(*) AS NUM_ESTADIOS_M
      FROM ESTADIO
      WHERE NOME LIKE 'M%'
      GROUP BY NOME);

-- LISTAR OS CODIGOS DAS SELEÇÕES QUE VENCERAM MAIS COPAS.
-- TA DANDO ERRO PQ NÃO TEM NENHUMA PARTICIPAÇÃO AINDA. O ORACLE RETORNA `INVALID_NUMBER`.
SELECT P.SELECAO_COD
FROM PARTICIPA P
WHERE P.COLOCACAO = 'CAMPEAO'
GROUP BY P.SELECAO_COD
HAVING COUNT(*) = (SELECT MAX(NUM_VITORIAS)
                   FROM (SELECT COUNT(*) AS NUM_VITORIAS
                         FROM PARTICIPA P2
                         WHERE P2.COLOCACAO = 'CAMPEAO'
                         GROUP BY P2.SELECAO_COD));

-----------------------------------------------------------------------------
-------------      CONSULTAS COM SUBCONSULTAS DO TIPO LINHA     -------------
-----------------------------------------------------------------------------

-- LISTAR O NOME DOS JOGADORES QUE ATUAM NA MESMA FUNÇÃO E RECEBEM O MESMO
-- SALARIO QUE O JOGADOR MAIS BEM PAGO.
SELECT J.NOME
FROM JOGADOR J
WHERE (J.NASCIMENTO, J.FUNCAO) = (SELECT J2.NASCIMENTO, J2.FUNCAO
                                  FROM JOGADOR J2
                                  WHERE J2.NOME = 'NEYMAR');

-- LISTAR O NOME DOS ESTADIOS QUE SÃO LOCALIZADOS NA MESMA CIDADE E NA MESMA RUA
-- DO ESTÁDIO QUE SEDIOU A FINAL DA COPA DE 2014.
SELECT E.NOME
FROM ESTADIO E
WHERE (E.END_CIDADE, E.END_RUA) = (SELECT E2.END_CIDADE, E2.END_RUA
                                  FROM ESTADIO E2
                                  WHERE E2.NOME = (SELECT P.ESTADIO_NOME
                                                  FROM PARTIDA P
                                                  WHERE P.FASE = 'FINAL' AND P.COPA_ANO = '2014'));

-----------------------------------------------------------------------------
------------- CONSULTAS COM SUBCONSULTAS DO TIPO TABELA         -------------
-----------------------------------------------------------------------------

-- LISTAR O NOME DOS JOGADORES QUE TREINARAM EM MAIS DE 2 ESTADIOS. 
SELECT J.NOME
FROM JOGADOR J
WHERE J.ID IN (SELECT T.JOGADOR_ID
              FROM TREINAMENTO T
              GROUP BY T.JOGADOR_ID
              HAVING COUNT(*) > 2);

-- LISTAR O CODIGO DAS SELEÇÕES QUE PARTICIPARAM DE MAIS COPAS DO QUE A MÉDIA.
SELECT S.CODIGO
FROM SELECAO S
WHERE S.CODIGO IN (SELECT P.SELECAO_COD
                   FROM PARTICIPA P
                   GROUP BY P.SELECAO_COD
                   HAVING COUNT(*) > (SELECT AVG(NUM_COPAS)
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

-- TODO



-----------------------------------------------------------------------------
-- !!!!!!!!!! TODO: SEPARAR AS CONSULTAS ABAIXO POR TOPICO !!!!!!!!!!

-- CONSULTAS COM SUBCONSULTA DO TIPO ESCALAR
--
-- NOME DAS SELEÇÕES CUJOS UNIFORMES PRINCIPAIS SÃO IGUAIS.
SELECT S1.CODIGO, S1.UNIFORME_PRINCIPAL
FROM SELECAO S1
JOIN (
  SELECT DISTINCT S2.UNIFORME_PRINCIPAL
  FROM SELECAO S2
  WHERE EXISTS (SELECT 1
                FROM SELECAO S3
                WHERE S2.UNIFORME_PRINCIPAL = S3.UNIFORME_PRINCIPAL
                AND S2.CODIGO <> S3.CODIGO)
  ) S4
  ON S1.UNIFORME_PRINCIPAL = S4.UNIFORME_PRINCIPAL
  ORDER BY S1.UNIFORME_PRINCIPAL, S1.CODIGO;


-- RETORNAR O NOME/NOMES DOS ESTÁDIOS QUE TIVERAM MAIS PARTIDAS NO ANO DE 2014.
SELECT E.ESTADIO_NOME, COUNT(*) AS NUM_DE_PARTIDAS 
FROM PARTIDA E 
WHERE E.COPA_ANO = '2014'
GROUP BY E.ESTADIO_NOME 
HAVING COUNT(*) = (SELECT MAX(partidas) 
    			   FROM (SELECT COUNT(*) as partidas 
                         FROM PARTIDA 
                         WHERE COPA_ANO = '2014'
                         GROUP BY ESTADIO_NOME));

-- LISTA O NOME DO JOGADOR, SELEÇÃO, SALÁRIO E A MÉDIA DE SALÁRIO DA SUA SELEÇÃO, RETORNANDO APENAS AQUELES COM MAIORES SALÁRIOS. 
SELECT j.NOME, jc.SELECAO_COD, j.SALARIO, media_salario.MEDIA_SALARIO
FROM JOGADOR j INNER JOIN JOGADOR_CONVOCADO jc ON j.ID_FIFA = jc.JOGADOR_ID 
              INNER JOIN (SELECT jc.SELECAO_COD, TRUNC(AVG(j.SALARIO)) AS MEDIA_SALARIO 
                          FROM JOGADOR j INNER JOIN JOGADOR_CONVOCADO jc ON j.ID_FIFA = jc.JOGADOR_ID 
                          GROUP BY jc.SELECAO_COD) media_salario 
              ON jc.SELECAO_COD = media_salario.SELECAO_COD 
              WHERE (jc.SELECAO_COD, j.SALARIO) IN (SELECT jc.SELECAO_COD, MAX(j.SALARIO) 
                                                    FROM JOGADOR j INNER JOIN JOGADOR_CONVOCADO jc ON j.ID_FIFA = jc.JOGADOR_ID 
                                                    GROUP BY jc.SELECAO_COD) 
              ORDER BY jc.SELECAO_COD;

-- RETORNE O NOME DOS JOGADORES ALEMÃES CONVOCADOS DA COPA DE 2014 ORDENADOS POR SUAS FUNÇÕES. 
SELECT J.NOME, J.FUNCAO
FROM JOGADOR J INNER JOIN JOGADOR_CONVOCADO JC ON J.ID_FIFA = JC.JOGADOR_ID
WHERE JC.SELECAO_COD = 'GER' AND JC.COPA_ANO = '2014'
ORDER BY J.FUNCAO;

-- RETORNE O NOME DOS JOGADORES QUE TREINARAM NO ESTÁDIO DO MINEIRÃO NA COPA DE 2014.
SELECT J.NOME 
FROM JOGADOR J INNER JOIN TREINAMENTO T ON J.ID_FIFA = T.JOGADOR_ID 
WHERE T.ESTADIO_NOME = 'Mineirão' AND EXTRACT(YEAR FROM T.DATA) = 2014;

-- Mostre o patrocinador que patrocina a seleção com maior média salarial de 2014
SELECT P.CNPJ
FROM PATROCINADOR P INNER JOIN PATROCINIO PT ON P.CNPJ = PT.PATROCINADOR_CNPJ
WHERE PT.SELECAO_COD = (SELECT jc.SELECAO_COD
                        FROM JOGADOR_CONVOCADO jc
                        INNER JOIN JOGADOR j ON jc.JOGADOR_ID = j.ID_FIFA
                        GROUP BY jc.SELECAO_COD
                        HAVING AVG(j.SALARIO) = (
                            SELECT MAX(media_sal)
                            FROM (
                                SELECT AVG(j2.SALARIO) AS media_sal
                                FROM JOGADOR_CONVOCADO jc2
                                INNER JOIN JOGADOR j2 ON jc2.JOGADOR_ID = j2.ID_FIFA
                                GROUP BY jc2.SELECAO_COD
                            )  
                        )  AND PT.COPA_ANO = '2014' 
);
