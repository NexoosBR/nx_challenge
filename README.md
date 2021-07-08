
# Desafio

O objetivo deste repositório é gerir empréstimos, salvando informações necessárias do cliente para realizar o cálculo do PMT (valor da parcela), além de possibilitar a leitura desses dados pelo cliente.


## Tarefas
- Modelar o banco de dados parar ter os dados necessários do cálculo da PMT
- Completar as rotas `POST /loans` e `GET /loans/ID`, alterando a API para escrever e retornar dados do banco de dados.
  - Na escrita, deve-se calcular o valor da parcela (PMT) e salvar no banco de dado


## Setup

- Ruby 2.7.2
- Rails 6.1.3.2
- SQlite3


## Configurando Ambiente

1. Clone o repositório ou faça download dos arquivos

2. Instale as Gems e dependências
```
  bundle install
```

3. Crie o banco de dados
```
  rails db:create
```
4. Execute as Migrations
```
  rails db:migrate
```

5. Rode a aplicação
```
  rails server
```

6. Acesse a aplicação
```http
  localhost:3000
```

## API Requests

#### Post Request para Loans

```http
  POST localhost:3000/loans
```

- Envie no corpo da request um json contendo os valores

| Parâmetro | Tipo     | Descrição                |
| :-------- | :------- | :------------------------- |
| `finance` | `float`  | **Obrigatório**. Valor do financiamento |
|   `tax`   | `float`  | **Obrigatório**. Taxa do financiamento |
| `months`  | `integer`| **Obrigatório**. Nº de Meses do financiamento |

#### Get Request para Loans

```http
  GET localhost:3000/loans/id
```

| Parâmetro | Tipo     | Descrição                       |
| :-------- | :------- | :-------------------------------- |
| `id`      | `integer` | Identificador do loan |
