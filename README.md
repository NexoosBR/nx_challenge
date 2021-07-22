# README

Nexoos Challenge

Seu desafio será completar o desenvolvimento dessa API capaz de gerir empréstimos, salvando informações necessárias do cliente para podermos realizar o cálculo do valor da parcela (PMT), além de haver a possibilidade de leitura desses dados pelo cliente.

Deve-se:

- Modelar o banco de dados parar ter os dados necessários do cálculo da PMT
- Completar as rotas `POST /loans` e `GET /loans/ID`, alterando a API para escrever e retornar dados do banco de dados.
  - Na escrita, deve-se calcular o valor da parcela (PMT) e salvar no banco de dados.

Sobre a PMT:

https://fia.com.br/blog/matematica-financeira/#:~:text=PMT%20s%C3%A3o%20pagamentos%20de%20mesmo,ou%20empresarial)%20de%20forma%20recorrente.&text=Por%20isso%2C%20tamb%C3%A9m%20s%C3%A3o%20tratados,fixa%20de%20empr%C3%A9stimo%20ou%20financiamento

Cálculo da PMT:

http://ghiorzi.org/amortiza.htm


Post Request para Loans:

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
2.2 - para verificar se os containers subiram sem problema, executar o comando: 
```
docker-compose logs
```
3 - criar a base de dados, executar migrations e popular a base com dados inicias: 
```
docker-compose run web rails db:create db:migrate db:seed
```
### Rodando SEM Docker
#### Configurando a base de dados:
Se você não tem PostgreSQL configurado em seu computador / notebook, siga os seguintes tutoriais:
* [Ubuntu Linux](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-18-04)
 * [MacOS](https://www.robinwieruch.de/postgres-sql-macos-setup)
 * [Windows](https://www.guru99.com/download-install-postgresql.html)

## Executando bateri de testes

