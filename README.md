# README
## Nexoos Challenge [![Made with Ruby](https://img.shields.io/badge/Ruby-2.7.2-green.svg)](https://www.ruby-lang.org/) [![Made with RoR](https://img.shields.io/badge/RoR-6.1.3.2-green.svg)](https://rubyonrails.org/) [![Build with Docker](https://img.shields.io/badge/docker-20.10.0-blue.svg)](https://rubyonrails.org/)

Desafio para desenvolvedor rails júnior Nexoos

## Tabela de Coneúdos
- [Visão Geral](#vis-o-geral)
- [Começando](#come-ando)
  * [Pré-Requisitos](#pr--requisitos)
- [Instalação](#instala--o)
  * [Rodando com Docker e Docker-Compose](#rodando-com-docker-e-docker-compose)
  * [Rodando SEM Docker](#rodando-sem-docker)
    + [1 - Configurando a base de dados:](#1---configurando-a-base-de-dados-)
  * [2 - Instalando o Ruby e Rails:](#2---instalando-o-ruby-e-rails-)
- [Utilizando a aplicação](#utilizando-a-aplica--o)
  * [Fazendo chamadas a API com curl](#fazendo-chamadas-a-api-com-curl)
  * [Operações com Clientes](#opera--es-com-clientes)
      - [RECUPERANDO (GET) todos os Clientes com seus respectivos empréstimos](#recuperando--get--todos-os-clientes-com-seus-respectivos-empr-stimos)
      - [RECUPERANDO (GET) Clientes ordenados por ordem Alfabética do Nome](#recuperando--get--clientes-ordenados-por-ordem-alfab-tica-do-nome)
      - [RECUPERANDO (GET) Clientes ordenados por ordem pela quantidade de empréstimos](#recuperando--get--clientes-ordenados-por-ordem-pela-quantidade-de-empr-stimos)
      - [RECUPERANDO (GET) um Cliente específico atavrés de seu id](#recuperando--get--um-cliente-espec-fico-atavr-s-de-seu-id)
      - [ATUALIZANDO (PATCH) as informações de um Cliente](#atualizando--patch--as-informa--es-de-um-cliente)
      - [ADICIONANDO (POST) um novo Cliente](#adicionando--post--um-novo-cliente)
      - [ADICIONANDO (POST) um novo Cliente com um EMPRÉSTIMO](#adicionando--post--um-novo-cliente-com-um-empr-stimo)
    + [Apagando (DELETE) um determinado cliente através de seu id](#apagando--delete--um-determinado-cliente-atrav-s-de-seu-id)
  * [Operações com Empréstimos (Loans)](#opera--es-com-empr-stimos--loans-)
      - [RECUPERANDO (GET) todos os Empréstimos](#recuperando--get--todos-os-empr-stimos)
      - [RECUPERANDO (GET) todos os Empréstimos de um determinado Cliente](#recuperando--get--todos-os-empr-stimos-de-um-determinado-cliente)
      - [RECUPERANDO (GET) todos os Empréstimos de um determinado Cliente ordenados pelo valor do Capital (Loan Amount)](#recuperando--get--todos-os-empr-stimos-de-um-determinado-cliente-ordenados-pelo-valor-do-capital--loan-amount-)
      - [RECUPERANDO (GET) um Empréstiom específico atavrés de seu id](#recuperando--get--um-empr-stiom-espec-fico-atavr-s-de-seu-id)
      - [ATUALIZANDO (PATCH) as informações de um Empréstimo](#atualizando--patch--as-informa--es-de-um-empr-stimo)
      - [ADICIONANDO (POST) um novo Empréstimo](#adicionando--post--um-novo-empr-stimo)
    + [Apagando (DELETE) um determinado Empréstimo através de seu id](#apagando--delete--um-determinado-empr-stimo-atrav-s-de-seu-id)
- [Executando bateria de testes](#executando-bateria-de-testes)
  * [Com Docker e Docker-compose](#com-docker-e-docker-compose)
  * [SEM Docker](#sem-docker)
    + [Para executar toda a bateria de testes:](#para-executar-toda-a-bateria-de-testes-)
- [Contribuir](#contribuir)
- [Contato](#contato)
## Visão Geral

Seu desafio será completar o desenvolvimento dessa API capaz de gerir empréstimos, salvando informações necessárias do cliente para podermos realizar o cálculo do valor da parcela (PMT), além de haver a possibilidade de leitura desses dados pelo cliente.

Deve-se:

- Modelar o banco de dados parar ter os dados necessários do cálculo da PMT
- Completar as rotas `POST /loans` e `GET /loans/ID`, alterando a API para escrever e retornar dados do banco de dados.
  - Na escrita, deve-se calcular o valor da parcela (PMT) e salvar no banco de dados.

Sobre a PMT:

[O que é PMT em matemática financeira?](https://fia.com.br/blog/matematica-financeira/#:~:text=PMT%20s%C3%A3o%20pagamentos%20de%20mesmo,ou%20empresarial%20de%20forma%20recorrente.&text=Por%20isso%2C%20tamb%C3%A9m%20s%C3%A3o%20tratados,fixa%20de%20empr%C3%A9stimo%20ou%20financiamento)

Cálculo da PMT:

http://ghiorzi.org/amortiza.htm


Post Request para Loans*:

```
curl --request POST http://localhost:3000/loans -d \
 value=1000& \
 taxa=0.2
```

Expected Response:

```
{
  "loan": {
    "id": 1
  }
}
```

Get Request para Loans:

```curl --request GET http://localhost:3000/loans/1```

Expected Response:
```
{
  "loan": {
    "id": 1, "pmt": 308
  }
}
```

Requisitos técnicos
- Usar Ruby on Rails
- É permitido o uso de frameworks e gems
- Deve ser usado GIT para versionamento

Pontos extras para:

- Documentação
- Testes unitários e/ou de integração com Rspec

Envio:

Envie o seu código pronto através de um Pull Request para esse repositório

## Começando

Essas instruções fornecerão uma cópia do projeto instalado e funcionando em sua máquina local para fins de desenvolvimento e teste.

### Pré-Requisitos

* Ruby 2.7.2
* Rails +6.1.3.2
* PostgreSQL 12.5

Caso prefira usar Docker:

* Docker 20.10.0
* Docker-compose 1.26.0

## Instalação

### Rodando com Docker e Docker-Compose
Na raíz do projeto, abra um terminal e execute as seguintes ações:
1 - fazer o build do projeto:
```
docker-compose build
```
2 - subindo os containers em segundo plano (-d):
```
docker-compose up -d
```
2.1 - para verificar se os containers subiram sem problema, executar o comando: 
```
docker-compose logs
```
3 - criar a base de dados, executar migrations: 
```
docker-compose run web rails db:create db:migrate
```
3.1 - caso queira executar os comandos acima e popular a base de dados:
```
docker-compose run web rails db:setup
```
3.2 - caso queira apagar as bases de dados, execute:
```
docker-compose run web rails db:drop
```
### Rodando SEM Docker
Configurando o ambiente de Desenvolvimento:
#### 1 - Configurando a base de dados:
 * [Ubuntu Linux](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-18-04)
 * [MacOS](https://www.robinwieruch.de/postgres-sql-macos-setup)
 * [Windows](https://www.guru99.com/download-install-postgresql.html)

 ### 2 - Instalando o Ruby e Rails:
 * [Install Ruby On Rails on Ubuntu 21.04 Hirsute Hippo (e outras versões), com rbenv ou rvm](https://gorails.com/setup/ubuntu/21.04)
 * [Install Ruby On Rails on macOS 11.0 Big Sur](https://gorails.com/setup/osx/11.0-big-sur)
 * [Install Ruby On Rails on Windows 10](https://gorails.com/setup/windows/10)

## Utilizando a aplicação

Por se tratar de uma aplicação back-end onde sua utilização é realizada através de chamada a uma API, sugerimos utlização do [curl](https://curl.se/) ou [Postman](https://www.postman.com) para interagir com a mesma.

Por se tratar de um desafio simples, trataremos o uso da API apenas com o curl. Caso queira realizar os testes com o Postman, você pode encontrar mais informações de utilizá-lo nos links abaixo:
* https://idratherbewriting.com/learnapidoc/docapis_understand_curl.html
* https://medium.com/beadlist/using-curl-for-api-testing-463803304620
* https://linuxize.com/post/curl-rest-api/

Primeiramente, inicie a aplicação, subindo os containers em segundo plano (-d):
```
docker-compose up -d
```
### Fazendo chamadas a API com curl
Seguem abaixo alguns exemplos de como utilizar o curl para interagir com apliação:
### Operações com Clientes
##### RECUPERANDO (GET) todos os Clientes com seus respectivos empréstimos
```
curl --request GET http://localhost:3000/clients
```
##### RECUPERANDO (GET) Clientes ordenados por ordem Alfabética do Nome
```

```
##### RECUPERANDO (GET) Clientes ordenados por ordem pela quantidade de empréstimos
```

```
##### RECUPERANDO (GET) um Cliente específico atavrés de seu id
```
curl --request GET http://localhost:3000/clients/{id}
```
##### ATUALIZANDO (PATCH) as informações de um Cliente
```

```
##### ADICIONANDO (POST) um novo Cliente
```

```
##### ADICIONANDO (POST) um novo Cliente com um EMPRÉSTIMO
```

```
#### Apagando (DELETE) um determinado cliente através de seu id
```
curl --X DELETE http://localhost:3000/clients/{id}
```
### Operações com Empréstimos (Loans)
##### RECUPERANDO (GET) todos os Empréstimos
```
curl --request GET http://localhost:3000/loans
```
##### RECUPERANDO (GET) todos os Empréstimos de um determinado Cliente
```

```
##### RECUPERANDO (GET) todos os Empréstimos de um determinado Cliente ordenados pelo valor do Capital (Loan Amount)
```

```
##### RECUPERANDO (GET) um Empréstiom específico atavrés de seu id
```
curl --request GET http://localhost:3000/loans/{id}
```
##### ATUALIZANDO (PATCH) as informações de um Empréstimo
```

```
##### ADICIONANDO (POST) um novo Empréstimo
```

```
#### Apagando (DELETE) um determinado Empréstimo através de seu id
```
curl --X DELETE http://localhost:3000/loans/{id}
```

## Executando bateria de testes

### Com Docker e Docker-compose
Para rodar a bateria de tests completa:
```
docker-compose run web rspec --format documentation
```
Caso queira executar uma 'spec' de um model específico:
```
docker-compose run web rspec spec/models/nome_da_espec.rb
```
Caso queira executar uma 'spec' de um controller específico:
```
docker-compose run web rspec spec/controllers/nome_da_espec.rb
```
### SEM Docker
Na raíz do projeto, executar os seguintes comandos:
#### Para executar toda a bateria de testes:
```
rspec
```
Caso queira executar uma 'spec' de um model específico:
```
rspec spec/models/nome_da_espec.rb
```
Caso queira executar uma 'spec' de um controller específico:
```
rspec spec/controllers/nome_da_espec.rb
```

## Contribuir
* Repositório original no Github: [NexoosBR/nx_challenge](https://github.com/NexoosBR/nx_challenge)

## Contato

Desafio feito por Rafael Viana Lopes Araújo

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](www.linkedin.com/in/rafael-viana-75529b32)
[![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/rvlaraujo)
[![Gmail](https://img.shields.io/badge/Gmail-D14836?style=for-the-badge&logo=gmail&logoColor=white)](mailto:rvlaraujo@gmail.com)
