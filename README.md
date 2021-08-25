# Nexoos Challenge
***
## Sobre o projeto

O desafio consiste em completar o desenvolvimento de uma API capaz de gerir empréstimos, salvando informações necessárias do cliente para realização do cálculo do valor da parcela (PMT), além de haver a possibilidade de leitura desses dados pelo cliente.
## Requisitos Necessários:

* Ruby 2.7.2
* Rails 6.1.3.2
* PostgreSQL 13.4

### Gems adicionais
<ul>
  <li>Testes</li>
  <ul>
    <li>Rspec</li>
    <li>Factory Bot</li>
    <li>Simplecov</li>
  </ul>
</ul>
  <li>Outras gems</li>
  <ul>
    <li>Rubocop</li>
  </ul>
</ul>

## Funcionalidades

* Realização do cálculo do valor da parcela (PMT)
* Leitura de um PMT cadastrado previamente

## Para executar o projeto:
* Clone em sua máquina

```shell
git clone https://github.com/weslley6216/nx_challenge.git
```

### Instale as dependências
```shell
cd nx_challenge
bin/setup
```

### Configure o Banco de Dados
Realize a criação de dados preexistentes no banco de dados com o comando
```shell
rails db:seed
```
## API

### Consultar uma simulação de empréstimo
#### get '/loans/:id'
* Retorna uma simulação de empréstimo ao receber um id válido
```
curl --request GET http://localhost:3000/loans/1 -H 'Content-Type: application/json'
```
#### Possíveis respostas
* HTTP Status: 200 - Simulação de empréstimo encontrado com sucesso
```
{"loan":{"id":1,"pmt":"349.88"}}
```
* HTTP Status: 404 - Código da simulação de empréstimo não existente
```
{
  "id": "238",
  "message":"Empréstimo não encontrado"
}
```
### Criação de Empréstimo
#### post '/loans/'
* Retorna um empréstimo após receber os seguintes parametros:
```
curl --request POST http://localhost:3000/loans -H 'Content-Type: application/json' -d '{"value":"3700", "rate":"2"}' 
```
Exemplo:
#### Possíveis respostas
* HTTP Status: 201 - Empréstimo criado com sucesso
```
{"loan":{"id":3}}
```

* HTTP Status: 422 - Parâmetros faltando ou em branco
```
{
  "value":[
            "não pode ficar em branco"
          ],

   "rate":[
            "não pode ficar em branco"
          ]
}
```
* HTTP Status: 422 - Parâmetros não sejam números
```
{
  "value":[
            "não é um número"
          ],

   "rate":[
            "não é um número"
          ]
}
```
* HTTP Status: 422 - Parâmetros que não sejam números maiores de zero
```
{
  "value":[
            "deve ser maior que 0"
          ],

   "rate":[
            "deve ser maior que 0"
          ]
}
```