# GDI-World-Cup
Repositório referente ao projeto da disciplina de Gerenciamento de Dados e Informação do Centro de Informática da UFPE. O objetivo do sistema é armazenar alguns dados das edições de Copa do Mundo.

# Mini-Mundo
Uma Pessoa é identificada pelo seu ID_FIFA, e contém Nome e Salário. Uma pessoa deve ser ou Jogador ou Técnico. Pede-se que seja armazenada a função de cada jogador. Uma pessoa pode fazer parte de várias seleções ao decorrer da vida, sendo armazenada a data em que esta pessoa fez parte de uma Seleção.Um Técnico pode treinar vários Jogadores em uma determinada data, os quais podem ser treinados por vários Técnicos. Um treino pode acontecer ou não em um Estádio.

Uma Seleção pode ser patrocinada por um Patrocinador, o qual é identificado pelo seu CNPJ. É pedido que seja armazenado apenas o patrocinador atual de uma Seleção, caso houver. Uma Seleção pode ter várias pessoas no decorrer do tempo. Uma Seleção é definida pelo seu País, e contém vários uniformes. Uma Seleção participa de várias Copas com uma respectiva colocação.

Uma Copa é definida pelo Ano em que ela ocorreu e também contém os Países-sedes. Uma Copa contém várias Seleções. Em uma Copa ocorrem várias partidas, as quais são identificadas a partir da Copa em que ela ocorreu e o número da partida naquela Copa. Uma partida contém a fase do campeonato, o resultado, a data e a hora em que ela ocorreu.

Em uma partida, uma Seleção Mandante e uma Seleção Visitante jogam em um Estádio. Em um Estádio, pode-se acontecer várias partidas. Um Estádio contém um Nome, sendo este um valor único entre todos os Estádios, e um endereço, o qual é composto por Rua, Número e Cidade.