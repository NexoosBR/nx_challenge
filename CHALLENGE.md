# README

Este repositório foi criado para propor a solução do seguinte desafio: Challenge Nx.

## <a name="tech_info"></a>Requisitos
* Docker: (v 20.10.7)

## Setup
1) Possuir Docker instalado na sua máquina (versão utilizada neste projeto de preferência)
2) Possuir Docker Compose instalado
3) Baixar este repositório com o comando: git clone git@github.com:NexoosBR/nx_challenge.git
4) E seguir para o Commit ~>

### Testando a aplicação
Atualmente o projeto conta com 97.52% de cobertura de teste, de acordo com o SimpleCov.

## Rodando o projeto localmente
1) Executar 'docker-compose build web'
2) Executar 'docker-compose up'
4) Entre no container e execute: 'docker-compose run web bash'
5) Caso queira fazer consultas no DB, execute 'make psql' no seu terminal (fora do container)

### Observação importante ao rodar a aplicação
* Essa aplicação está configurada para fazer o encaminhamento na porta 3000, caso tenha outro projeto rodando nesta porta, será necessário mudar o docker-compose.yml ou derrubar a aplicação que está rodando nesta porta. A segunda opção é a mais adequada.

### Criando Recursos na API
* Envie uma requisição com o verbo POST no endpoint de Requester: http://localhost:3000/api/v1/requesters, passando todos os atributos       necessários, por exemplo:
  { 
    "name": "Renan LTDA",
    "cnpj": "00.555.666/0001-30",
    "phone": "+298 1-141-392-4963 x41338",
    "email": "email@email.com",
    "commercial_address": "702 Latasha Creek, Lake Samual, NM 6666",
    "company_birth": "1989-06-06" };

* Envie uma requisição com o verbo POST no endpoint de Credit: http://localhost:3000/api/v1/credits, passando todos os atributos necessários, por exemplo:
  {
    "amount": 8000.00,
    "credit_at": "2020-06-30",
    "accept": "s",
    "requester_id": ID_DO_REQUESTER_CRIADO_ACIMA };

* Envie uma requisição com o verbo POST no endpoint: http://localhost:3000/api/v1/loans passando todos os atributos necessários, por exemplo:
  {
    "amount": 8000.00,
    "tax": 0.05,
    "term": 12,
    "credit_id": ID_DO_CREDIT_CRIADO_ACIMA };

* Agora, envie uma requisição com o verbo GET no endpoint: http://localhost:3000/api/v1/loans/ID_DO_LOAN_CRIADO

### Observação importante sobre o desenvolvimento:
- Gostaria de pontuar que, ao desenvolver essa API, tentei de forma simples e clara resolver o problema, que é responder um Payment calculado com os parâmetros obrigatórios. Não está lindo do jeito que eu gostaria, mas segui a premissa de que sabemos o que enviar nas requisições. Não me preocupei com telas neste momento, por não ser um ponto ainda trabalhado por mim. Me dediquei ao máximo calcular e responder de acordo com o que foi solicitado. 

## Gems
* RSpec (um dos métodos possíveis dentro do Ruby/Rails para desenvolver as classes de testes. Gosto muito do padrão do RSpec);
* Simplecov (indica o percentual de cobertura de testes do seu projeto;
* Byebug (ferramenta para debuggin, caso preciso identificar alguma falha no meu teste e analisar como estão chegando dados);
* Faker (é uma ferramenta que tem o intuito de criar dados falsos: nome de pessoas, endereços, CEPs, emails, telefones..);
* Factory Bot (gerar objetos para os testes automatizados de forma pré-definida, alterando uma informação do obejto somente se necessário);