
Construção do projeto de sonda para Marte:

Eu separei as responsabilidades de acordo com as classes: 
  - Rover - representa a sonda, que efetivamente está em solo. Ela me passa a informação de aonde pousou e anda
e se move em 90 graus para esquerda e para a direita. Também guarda o histórico do caminho.

  -FieldTrack - Mapeia o campo aonde a sonda está. É uma representação cartesiana do terreno. Tem uma matriz onde cada coordenada pode ter uma sonda.
Ela me fala da posição de alguma sonda e me permite a remoção ou adição da sonda.

  -RoversControl - É a classe responsável pelo controle da sonda e atualização do terreno. É a classe principal do sistema.
Nela eu insiro um array de sondas, a representação do terreno e atualizo a posição de acordo com o movimento das sondas.
As sondas são acionadas e recebem um conjunto de instruções, executam os movimentos e depois passam o histórico de movimentos 
para serem atualizadas no FieldTrack. O movimento das sondas é separado da sua posição na representação do terreno.

Observações: 

-Não foi utilizada nenhuma gema que não seja o rspec, para criar os testes conforme especificado no Gemfile.
-Os testes foram feitos de acordo com os valores do projeto, menos o Fieldtrack, que foi criado nos testes com [6,6] 
e não [5,5] por que foram usados vetores que começam com Zero, portando o valor da ultima posição é 4.
Como uma das coordenadas do teste tem a posição x igual a 5, teve que ser assim. 