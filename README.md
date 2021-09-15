
# Nexoos Challenge
#### Sobre o Cálculo PMT
Também conhecido como sistema francês, o sistema Price é utilizada para amortizar uma dívida com parcelas constantes. A fórmula geral da parcela no sistema Price é dada pela fórmula:

![fórmula PMT]( https://www.renatrader.com.br/images/aprender/matematica-financeira/image034.gif)

Onde:

PMT = Valor da parcela  
VP = Valor presente da dívida  
i = taxa de juros  
n = número de períodos

 #### Configuração do Ambiente
Para executar o desafio em seu computador você precisa do **Git** e **Docker**

1.  Escolha um diretorio em seu computador.
2.  Clone o projeto no seu computador
	 `git clone https://github.com/jhonattasantos/nx_challenge.git`
3.  Entre no diretorio  `cd nx_challenge`
4.  Suba o container:  `docker-compose up --build`
5.  Criação das Migrações:  `docker-compose run web rails db:migrate`

 #### Executando tests
 `docker-compose run web rspec`
 Logo apos a execução dos testes vai ser gerado o diretorio `application/coverage` e um arquivo index.html para analise da cobertura dos teste