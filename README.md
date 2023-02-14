# GDI-World-Cup
Repositório referente ao projeto da disciplina de Gerenciamento de Dados e Informação do Centro de Informática da UFPE. O objetivo do sistema é armazenar alguns dados das edições de Copa do Mundo.

# Mini-Mundo
Uma Pessoa é identificada pelo seu **ID_FIFA** e contém *nome* e *salário*. Uma pessoa deve ser ou Jogador ou Técnico. Pede-se que seja armazenada a *função* de cada Jogador.

Uma Federação, identificada pelo seu **ID**, pode dirigir várias Federações, porém só pode ser dirigida por uma única Federação. Uma Federação pode administrar uma única Seleção. Uma Seleção, identificada pelo seu **Código**, deve ser administrada por uma Federação. Pede-se que seja armazenado os *uniformes* de uma Seleção. 

Uma Seleção pode ser patrocinada por vários Patrocinadores, o quais são identificados pelo seu **CNPJ**, em uma determinada Copa. Um Patrocinador pode patrocinar várias Seleções em uma Copa. Uma Seleção pode ser patrocinada por um Patrocinador em várias Copas. Uma Copa é identificada pelo seu **Ano**. Pede-se que sejam armazenados os *países-sede* de uma Copa. 

Uma Seleção pode participar de várias Copas, as quais envolvem várias Seleções. Cada participação de Seleção em Copa, pode haver um Técnico que treina a Seleção na Copa e vários Jogadores que são convocados para a participação. Pede-se que seja armazenada a *colocação* da participação de uma Seleção em uma Copa.

Em uma Copa, ocorrem várias partidas, e cada partida só ocorre em uma Copa. Uma Partida é identificada pelo **Ano** da Copa e um **número** indicando a ordem da Partida naquela Copa. Uma Partida deve ter uma Seleção mandante, uma Seleção Visitante, e deve ocorrer em um Estádio. Uma Seleção pode ser mandante ou visitante de várias partidas. Em um Estádio podem ocorrer várias Partidas, mas uma Partida ocorre em apenas um Estádio. Pede-se que seja armazenado também a *fase*, o *resultado*, a *data* e a *hora* da Partida.

Um Estádio, identificado pelo seu **Nome**, contém *endereço*, o qual é formado por *cidade*,  *rua* e*número*. Um Jogador pode treinar em vários Estádios, os quais podem ocorrer treinamento de vãrios Jogadores.

### Diagrama EER
![image](https://user-images.githubusercontent.com/42243880/218627308-bad02de0-a5f3-4e37-92b2-cf9eab7e2956.png)
