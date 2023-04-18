ALTER SESSION SET NLS_DATE_FORMAT='YYYY-MM-DD HH24:MI:SS';

-- INSERT COPA
INSERT INTO COPA(ANO) VALUES ('2010');
INSERT INTO PAIS(COPA_ANO, NOME) VALUES ('2010', 'AFRICA DO SUL');

INSERT INTO COPA(ANO) VALUES ('2014');
INSERT INTO PAIS(COPA_ANO, NOME) VALUES ('2014', 'BRASIL');

INSERT INTO COPA(ANO) VALUES ('2018');
INSERT INTO PAIS(COPA_ANO, NOME) VALUES ('2018', 'RUSSIA');

INSERT INTO COPA(ANO) VALUES ('2022');
INSERT INTO PAIS(COPA_ANO, NOME) VALUES ('2022', 'QATAR');


-- INSERT PATROCINADOR
INSERT INTO PATROCINADOR(CNPJ) VALUES('12345678901234');

INSERT INTO PATROCINADOR(CNPJ) VALUES('98765432101234');


-- INSERT FEDERACAO
INSERT INTO FEDERACAO(ID, DIRIGENTE_ID) VALUES ('DFB', NULL);

INSERT INTO FEDERACAO(ID, DIRIGENTE_ID) VALUES ('RFEF', NULL);

INSERT INTO FEDERACAO(ID, DIRIGENTE_ID) VALUES ('FA', NULL);

INSERT INTO FEDERACAO(ID, DIRIGENTE_ID) VALUES ('FIFA', NULL);

INSERT INTO FEDERACAO(ID, DIRIGENTE_ID) VALUES ('CONMEBOL', 'FIFA');

INSERT INTO FEDERACAO(ID, DIRIGENTE_ID) VALUES ('CBF', 'CONMEBOL');


-- INSERT SELECAO
INSERT INTO SELECAO(FEDERACAO_ID, CODIGO, UNIFORME_PRINCIPAL, UNIFORME_SECUNDARIO) VALUES ('CBF', 'BRA', 'Amarelo', 'Azul');

INSERT INTO SELECAO(FEDERACAO_ID, CODIGO, UNIFORME_PRINCIPAL, UNIFORME_SECUNDARIO) VALUES ('DFB', 'GER', 'Branco', 'Preto');

INSERT INTO SELECAO(FEDERACAO_ID, CODIGO, UNIFORME_PRINCIPAL, UNIFORME_SECUNDARIO) VALUES ('RFEF', 'ESP', 'Vermelho', 'Azul');

INSERT INTO SELECAO(FEDERACAO_ID, CODIGO, UNIFORME_PRINCIPAL, UNIFORME_SECUNDARIO) VALUES ('FA', 'ENG', 'Branco', 'Vermelho');


-- INSERT ESTADIO
INSERT INTO ESTADIO(NOME, END_RUA, END_NUM, END_CIDADE) VALUES ('Maracanã', 'Rua Professor Eurico Rabelo', 45, 'Rio de Janeiro');

INSERT INTO ESTADIO(NOME, END_RUA, END_NUM, END_CIDADE) VALUES ('São Januário', 'Rua do Vasco', 12, 'Rio de Janeiro');

INSERT INTO ESTADIO(NOME, END_RUA, END_NUM, END_CIDADE) VALUES ('Engenhão', 'Rua do Fogão', 14, 'Rio de Janeiro');

INSERT INTO ESTADIO(NOME, END_RUA, END_NUM, END_CIDADE) VALUES ('Mineirão', 'Av. Antônio Abrahão Caram', 1001, 'Belo Horizonte');

INSERT INTO ESTADIO(NOME, END_RUA, END_NUM, END_CIDADE) VALUES ('Morumbi', 'Praça Roberto Gomes Pedrosa', 1, 'São Paulo');

INSERT INTO ESTADIO(NOME, END_RUA, END_NUM, END_CIDADE) VALUES ('Beira-Rio', 'Avenida Padre Cacique', 891, 'Porto Alegre');

INSERT INTO ESTADIO(NOME, END_RUA, END_NUM, END_CIDADE) VALUES ('Lusail', 'Rua Lusail', 123, 'Lusail');

INSERT INTO ESTADIO(NOME, END_RUA, END_NUM, END_CIDADE) VALUES ('Ginásio de Esportes Lusail', 'Rua Lusail', 332, 'Lusail');


-- INSERT PARTIDA
INSERT INTO PARTIDA(COPA_ANO, NUMERO, FASE, RESULTADO, DATA_HORA, SELECAO_MANDANTE_COD, SELECAO_VISITANTE_COD, ESTADIO_NOME) VALUES ('2014', 1, 'semi final', '7x1', TO_TIMESTAMP('2014-06-12 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'BRA', 'GER', 'Maracanã');

INSERT INTO PARTIDA(COPA_ANO, NUMERO, FASE, RESULTADO, DATA_HORA, SELECAO_MANDANTE_COD, SELECAO_VISITANTE_COD, ESTADIO_NOME) VALUES ('2014', 13, 'semi final', '2x1', TO_TIMESTAMP('2014-06-12 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'ESP', 'ENG', 'Mineirão');

INSERT INTO PARTIDA(COPA_ANO, NUMERO, FASE, RESULTADO, DATA_HORA, SELECAO_MANDANTE_COD, SELECAO_VISITANTE_COD, ESTADIO_NOME) VALUES ('2014', 56, 'final', '4x2', TO_TIMESTAMP('2014-06-15 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'BRA', 'ESP', 'Morumbi');

INSERT INTO PARTIDA(COPA_ANO, NUMERO, FASE, RESULTADO, DATA_HORA, SELECAO_MANDANTE_COD, SELECAO_VISITANTE_COD, ESTADIO_NOME) VALUES ('2014', 19, '3º lugar', '2x0', TO_TIMESTAMP('2014-06-14 13:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'GER', 'ENG', 'Beira-Rio');


-- INSERT TECNICO
INSERT INTO TECNICO (ID_FIFA, SALARIO, NOME) VALUES ('0001', 15000.00, 'João Silva');

INSERT INTO TECNICO (ID_FIFA, SALARIO, NOME) VALUES ('0002', 20000.00, 'Maria Santos');

INSERT INTO TECNICO (ID_FIFA, SALARIO, NOME) VALUES ('0003', 18000.00, 'Pedro Rodrigues');

INSERT INTO TECNICO (ID_FIFA, SALARIO, NOME) VALUES ('0004', 25000.00, 'Ana Oliveira');


-- INSERT JOGADOR
-- BRASIL
INSERT INTO JOGADOR(ID_FIFA, SALARIO, NOME, FUNCAO) VALUES ('0005', 150000.00, 'Ronaldinho', 'Atacante');

INSERT INTO JOGADOR(ID_FIFA, SALARIO, NOME, FUNCAO) VALUES ('0006', 200000.00, 'Neymar', 'Atacante');

INSERT INTO JOGADOR(ID_FIFA, SALARIO, NOME, FUNCAO) VALUES ('0007', 100000.00, 'Coutinho', 'Meia');

INSERT INTO JOGADOR(ID_FIFA, SALARIO, NOME, FUNCAO) VALUES ('0008', 90000.00, 'Firmino', 'Atacante');

INSERT INTO JOGADOR(ID_FIFA, SALARIO, NOME, FUNCAO) VALUES ('0009', 80000.00, 'Marquinhos', 'Zagueiro');

INSERT INTO JOGADOR(ID_FIFA, SALARIO, NOME, FUNCAO) VALUES ('0010', 75000.00, 'Alisson', 'Goleiro');

INSERT INTO JOGADOR(ID_FIFA, SALARIO, NOME, FUNCAO) VALUES ('0011', 70000.00, 'Casemiro', 'Meia');

INSERT INTO JOGADOR(ID_FIFA, SALARIO, NOME, FUNCAO) VALUES ('0012', 85000.00, 'Fernandinho', 'Meia');

INSERT INTO JOGADOR(ID_FIFA, SALARIO, NOME, FUNCAO) VALUES ('0013', 80000.00, 'Marcelo', 'Lateral');

INSERT INTO JOGADOR(ID_FIFA, SALARIO, NOME, FUNCAO) VALUES ('0014', 90000.00, 'Thiago Silva', 'Zagueiro');

INSERT INTO JOGADOR(ID_FIFA, SALARIO, NOME, FUNCAO) VALUES ('0015', 75000.00, 'Gabriel Jesus', 'Atacante');

-- ALEMANHA
INSERT INTO JOGADOR(ID_FIFA, SALARIO, NOME, FUNCAO) VALUES ('0016', 100000.00, 'Manuel Neuer', 'Goleiro');

INSERT INTO JOGADOR(ID_FIFA, SALARIO, NOME, FUNCAO) VALUES ('0017', 150000.00, 'Toni Kroos', 'Meia');

INSERT INTO JOGADOR(ID_FIFA, SALARIO, NOME, FUNCAO) VALUES ('0018', 120000.00, 'Thomas Muller', 'Atacante');

INSERT INTO JOGADOR(ID_FIFA, SALARIO, NOME, FUNCAO) VALUES ('0019', 130000.00, 'Mats Hummels', 'Zagueiro');

INSERT INTO JOGADOR(ID_FIFA, SALARIO, NOME, FUNCAO) VALUES ('0020', 90000.00, 'Joshua Kimmich', 'Meia');

INSERT INTO JOGADOR(ID_FIFA, SALARIO, NOME, FUNCAO) VALUES ('0021', 80000.00, 'Gnabry', 'Atacante');

INSERT INTO JOGADOR(ID_FIFA, SALARIO, NOME, FUNCAO) VALUES ('0022', 95000.00, 'Leroy Sane', 'Atacante');

INSERT INTO JOGADOR(ID_FIFA, SALARIO, NOME, FUNCAO) VALUES ('0023', 70000.00, 'Leon Goretzka', 'Meia');

INSERT INTO JOGADOR(ID_FIFA, SALARIO, NOME, FUNCAO) VALUES ('0024', 75000.00, 'Antonio Rudiger', 'Zagueiro');

INSERT INTO JOGADOR(ID_FIFA, SALARIO, NOME, FUNCAO) VALUES ('0025', 85000.00, 'Ilkay Gundogan', 'Meia');

INSERT INTO JOGADOR(ID_FIFA, SALARIO, NOME, FUNCAO) VALUES ('0026', 70000.00, 'Timo Werner', 'Atacante');

-- INGLATERRA
INSERT INTO JOGADOR (ID_FIFA, SALARIO, NOME, FUNCAO) VALUES ('0027', 1500000.00, 'Harry Kane', 'Atacante');

INSERT INTO JOGADOR (ID_FIFA, SALARIO, NOME, FUNCAO) VALUES ('0028', 1200000.00, 'Raheem Sterling', 'Atacante');

INSERT INTO JOGADOR (ID_FIFA, SALARIO, NOME, FUNCAO) VALUES ('0029', 1100000.00, 'Jordan Henderson', 'Meio-campo');

INSERT INTO JOGADOR (ID_FIFA, SALARIO, NOME, FUNCAO) VALUES ('0030', 900000.00, 'Harry Maguire', 'Zagueiro');

INSERT INTO JOGADOR (ID_FIFA, SALARIO, NOME, FUNCAO) VALUES ('0031', 800000.00, 'Kyle Walker', 'Lateral-direito');

INSERT INTO JOGADOR (ID_FIFA, SALARIO, NOME, FUNCAO) VALUES ('0032', 750000.00, 'John Stones', 'Zagueiro');

INSERT INTO JOGADOR (ID_FIFA, SALARIO, NOME, FUNCAO) VALUES ('0033', 700000.00, 'Jadon Sancho', 'Atacante');

INSERT INTO JOGADOR (ID_FIFA, SALARIO, NOME, FUNCAO) VALUES ('0034', 650000.00, 'Marcus Rashford', 'Atacante');

INSERT INTO JOGADOR (ID_FIFA, SALARIO, NOME, FUNCAO) VALUES ('0035', 600000.00, 'Declan Rice', 'Meio-campo');

INSERT INTO JOGADOR (ID_FIFA, SALARIO, NOME, FUNCAO) VALUES ('0036', 550000.00, 'Luke Shaw', 'Lateral-esquerdo');

INSERT INTO JOGADOR (ID_FIFA, SALARIO, NOME, FUNCAO) VALUES ('0037', 500000.00, 'Jordan Pickford', 'Goleiro');

-- ESPANHA
INSERT INTO JOGADOR (ID_FIFA, SALARIO, NOME, FUNCAO) VALUES ('0038', 15000, 'Sergio Ramos', 'Zagueiro');

INSERT INTO JOGADOR (ID_FIFA, SALARIO, NOME, FUNCAO) VALUES ('0039', 13000, 'Gerard Piqué', 'Zagueiro');

INSERT INTO JOGADOR (ID_FIFA, SALARIO, NOME, FUNCAO) VALUES('0040', 17000, 'Jordi Alba', 'Lateral Esquerdo');

INSERT INTO JOGADOR (ID_FIFA, SALARIO, NOME, FUNCAO) VALUES('0041', 12000, 'Sergio Busquets', 'Volante');

INSERT INTO JOGADOR (ID_FIFA, SALARIO, NOME, FUNCAO) VALUES('0042', 18000, 'David Silva', 'Meio-Campo');

INSERT INTO JOGADOR (ID_FIFA, SALARIO, NOME, FUNCAO) VALUES('0043', 11000, 'Isco', 'Meia-atacante');

INSERT INTO JOGADOR (ID_FIFA, SALARIO, NOME, FUNCAO) VALUES('0044', 16000, 'Thiago Alcântara', 'Meio-Campo');

INSERT INTO JOGADOR (ID_FIFA, SALARIO, NOME, FUNCAO) VALUES('0045', 19000, 'Marco Asensio', 'Atacante');

INSERT INTO JOGADOR (ID_FIFA, SALARIO, NOME, FUNCAO) VALUES('0046', 14000, 'Álvaro Morata', 'Atacante');

INSERT INTO JOGADOR (ID_FIFA, SALARIO, NOME, FUNCAO) VALUES('0047', 10000, 'Iago Aspas', 'Atacante');

INSERT INTO JOGADOR (ID_FIFA, SALARIO, NOME, FUNCAO) VALUES('0048', 15000, 'Koke', 'Meio-Campo');


-- INSERT PARTICIPA (SELECAO + COPA)
INSERT INTO PARTICIPA(SELECAO_COD, COPA_ANO, COLOCACAO, TECNICO_ID) VALUES ('BRA', '2014', 1, '0001');

INSERT INTO PARTICIPA(SELECAO_COD, COPA_ANO, COLOCACAO, TECNICO_ID) VALUES ('ESP', '2014', 2, '0003');

INSERT INTO PARTICIPA(SELECAO_COD, COPA_ANO, COLOCACAO, TECNICO_ID) VALUES ('GER', '2014', 3, '0002');

INSERT INTO PARTICIPA(SELECAO_COD, COPA_ANO, COLOCACAO, TECNICO_ID) VALUES ('ENG', '2014', 4, '0004');


-- INSERT JOGADOR_CONVOCADO (JOGADOR + PARTICPA) => PARTCIPA = SELECAO + COPA
-- BRASIL
INSERT INTO JOGADOR_CONVOCADO (JOGADOR_ID, SELECAO_COD, COPA_ANO) VALUES ('0005', 'BRA', '2014');

INSERT INTO JOGADOR_CONVOCADO (JOGADOR_ID, SELECAO_COD, COPA_ANO) VALUES ('0006', 'BRA', '2014');

INSERT INTO JOGADOR_CONVOCADO (JOGADOR_ID, SELECAO_COD, COPA_ANO) VALUES ('0007', 'BRA', '2014');

INSERT INTO JOGADOR_CONVOCADO (JOGADOR_ID, SELECAO_COD, COPA_ANO) VALUES ('0008', 'BRA', '2014');

INSERT INTO JOGADOR_CONVOCADO (JOGADOR_ID, SELECAO_COD, COPA_ANO) VALUES ('0009', 'BRA', '2014');

INSERT INTO JOGADOR_CONVOCADO (JOGADOR_ID, SELECAO_COD, COPA_ANO) VALUES ('0010', 'BRA', '2014');

INSERT INTO JOGADOR_CONVOCADO (JOGADOR_ID, SELECAO_COD, COPA_ANO) VALUES ('0011', 'BRA', '2014');

INSERT INTO JOGADOR_CONVOCADO (JOGADOR_ID, SELECAO_COD, COPA_ANO) VALUES ('0012', 'BRA', '2014');

INSERT INTO JOGADOR_CONVOCADO (JOGADOR_ID, SELECAO_COD, COPA_ANO) VALUES ('0013', 'BRA', '2014');

INSERT INTO JOGADOR_CONVOCADO (JOGADOR_ID, SELECAO_COD, COPA_ANO) VALUES ('0014', 'BRA', '2014');

INSERT INTO JOGADOR_CONVOCADO (JOGADOR_ID, SELECAO_COD, COPA_ANO) VALUES ('0015', 'BRA', '2014');

-- ALEMANHA
INSERT INTO JOGADOR_CONVOCADO (JOGADOR_ID, SELECAO_COD, COPA_ANO) VALUES ('0016', 'GER', '2014');

INSERT INTO JOGADOR_CONVOCADO (JOGADOR_ID, SELECAO_COD, COPA_ANO) VALUES ('0017', 'GER', '2014');

INSERT INTO JOGADOR_CONVOCADO (JOGADOR_ID, SELECAO_COD, COPA_ANO) VALUES ('0018', 'GER', '2014');

INSERT INTO JOGADOR_CONVOCADO (JOGADOR_ID, SELECAO_COD, COPA_ANO) VALUES ('0019', 'GER', '2014');

INSERT INTO JOGADOR_CONVOCADO (JOGADOR_ID, SELECAO_COD, COPA_ANO) VALUES ('0020', 'GER', '2014');

INSERT INTO JOGADOR_CONVOCADO (JOGADOR_ID, SELECAO_COD, COPA_ANO) VALUES ('0021', 'GER', '2014');

INSERT INTO JOGADOR_CONVOCADO (JOGADOR_ID, SELECAO_COD, COPA_ANO) VALUES ('0022', 'GER', '2014');

INSERT INTO JOGADOR_CONVOCADO (JOGADOR_ID, SELECAO_COD, COPA_ANO) VALUES ('0023', 'GER', '2014');

INSERT INTO JOGADOR_CONVOCADO (JOGADOR_ID, SELECAO_COD, COPA_ANO) VALUES ('0024', 'GER', '2014');

INSERT INTO JOGADOR_CONVOCADO (JOGADOR_ID, SELECAO_COD, COPA_ANO) VALUES ('0025', 'GER', '2014');

INSERT INTO JOGADOR_CONVOCADO (JOGADOR_ID, SELECAO_COD, COPA_ANO) VALUES ('0026', 'GER', '2014');

-- INGLATERRA
INSERT INTO JOGADOR_CONVOCADO (JOGADOR_ID, SELECAO_COD, COPA_ANO) VALUES ('0027', 'ENG', '2014');

INSERT INTO JOGADOR_CONVOCADO (JOGADOR_ID, SELECAO_COD, COPA_ANO) VALUES ('0028', 'ENG', '2014');

INSERT INTO JOGADOR_CONVOCADO (JOGADOR_ID, SELECAO_COD, COPA_ANO) VALUES ('0029', 'ENG', '2014');

INSERT INTO JOGADOR_CONVOCADO (JOGADOR_ID, SELECAO_COD, COPA_ANO) VALUES ('0030', 'ENG', '2014');

INSERT INTO JOGADOR_CONVOCADO (JOGADOR_ID, SELECAO_COD, COPA_ANO) VALUES ('0031', 'ENG', '2014');

INSERT INTO JOGADOR_CONVOCADO (JOGADOR_ID, SELECAO_COD, COPA_ANO) VALUES ('0032', 'ENG', '2014');

INSERT INTO JOGADOR_CONVOCADO (JOGADOR_ID, SELECAO_COD, COPA_ANO) VALUES ('0033', 'ENG', '2014');

INSERT INTO JOGADOR_CONVOCADO (JOGADOR_ID, SELECAO_COD, COPA_ANO) VALUES ('0034', 'ENG', '2014');

INSERT INTO JOGADOR_CONVOCADO (JOGADOR_ID, SELECAO_COD, COPA_ANO) VALUES ('0035', 'ENG', '2014');

INSERT INTO JOGADOR_CONVOCADO (JOGADOR_ID, SELECAO_COD, COPA_ANO) VALUES ('0036', 'ENG', '2014');

INSERT INTO JOGADOR_CONVOCADO (JOGADOR_ID, SELECAO_COD, COPA_ANO) VALUES ('0037', 'ENG', '2014');

-- ESPANHA
INSERT INTO JOGADOR_CONVOCADO (JOGADOR_ID, SELECAO_COD, COPA_ANO) VALUES ('0038', 'ESP', '2014');

INSERT INTO JOGADOR_CONVOCADO (JOGADOR_ID, SELECAO_COD, COPA_ANO) VALUES ('0039', 'ESP', '2014');

INSERT INTO JOGADOR_CONVOCADO (JOGADOR_ID, SELECAO_COD, COPA_ANO) VALUES ('0040', 'ESP', '2014');

INSERT INTO JOGADOR_CONVOCADO (JOGADOR_ID, SELECAO_COD, COPA_ANO) VALUES ('0041', 'ESP', '2014');

INSERT INTO JOGADOR_CONVOCADO (JOGADOR_ID, SELECAO_COD, COPA_ANO) VALUES ('0042', 'ESP', '2014');

INSERT INTO JOGADOR_CONVOCADO (JOGADOR_ID, SELECAO_COD, COPA_ANO) VALUES ('0043', 'ESP', '2014');

INSERT INTO JOGADOR_CONVOCADO (JOGADOR_ID, SELECAO_COD, COPA_ANO) VALUES ('0044', 'ESP', '2014');

INSERT INTO JOGADOR_CONVOCADO (JOGADOR_ID, SELECAO_COD, COPA_ANO) VALUES ('0045', 'ESP', '2014');

INSERT INTO JOGADOR_CONVOCADO (JOGADOR_ID, SELECAO_COD, COPA_ANO) VALUES ('0046', 'ESP', '2014');

INSERT INTO JOGADOR_CONVOCADO (JOGADOR_ID, SELECAO_COD, COPA_ANO) VALUES ('0047', 'ESP', '2014');

INSERT INTO JOGADOR_CONVOCADO (JOGADOR_ID, SELECAO_COD, COPA_ANO) VALUES ('0048', 'ESP', '2014');


-- INSERT TREINAMENTO (JOGADOR + ESTADIO)
INSERT INTO TREINAMENTO(JOGADOR_ID, ESTADIO_NOME, DATA) VALUES ('0005', 'Mineirão', '2014-06-06');

INSERT INTO TREINAMENTO(JOGADOR_ID, ESTADIO_NOME, DATA) VALUES ('0006', 'Mineirão', '2014-06-08');

INSERT INTO TREINAMENTO(JOGADOR_ID, ESTADIO_NOME, DATA) VALUES ('0007', 'Mineirão', '2014-06-09');

INSERT INTO TREINAMENTO(JOGADOR_ID, ESTADIO_NOME, DATA) VALUES ('0008', 'Mineirão', '2014-06-10');

INSERT INTO TREINAMENTO(JOGADOR_ID, ESTADIO_NOME, DATA) VALUES ('0021', 'Beira-Rio', '2014-06-06');

INSERT INTO TREINAMENTO(JOGADOR_ID, ESTADIO_NOME, DATA) VALUES ('0022', 'Beira-Rio', '2014-06-10');

INSERT INTO TREINAMENTO(JOGADOR_ID, ESTADIO_NOME, DATA) VALUES ('0023', 'Beira-Rio', '2014-06-08');

INSERT INTO TREINAMENTO(JOGADOR_ID, ESTADIO_NOME, DATA) VALUES ('0024', 'Beira-Rio', '2014-06-09');


-- INSERT PATROCINIO (COPA + PATROCINADOR + SELECAO)
INSERT INTO PATROCINIO(COPA_ANO, PATROCINADOR_CNPJ, SELECAO_COD) VALUES ('2014', '12345678901234', 'BRA');

INSERT INTO PATROCINIO(COPA_ANO, PATROCINADOR_CNPJ, SELECAO_COD) VALUES ('2014', '98765432101234', 'GER');