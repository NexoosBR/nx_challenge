# Sobre o desafio
Para gerenciar os empréstimos da maneira mais simples possível, foi criado dois endpoints, um de clientes (customers) e outro de empréstimos (loans).

## Rubocop Airbnb
A parte desenvolvida para solucionar esse desafio está seguindo os mesmos padrões de código-fonte usada no RuboCop da Airbnb afim de evitar espaços desnecessários, códigos verbosos e definir uma padronização de código entre uma squad de desenvolvimento, e assim, evitando que cada um siga seu próprio padrão dentro de uma equipe.

## Cobertura de testes - *coverage 100%*
Esse projeto com seu código-fonte totalmente coberto por testes com RSpec.

## Rodando o projeto
Estamos utilizando o MySQL como banco de dados, portanto, antes que qualquer coisa, confira os dados de acesso ao banco de dados no arquivo `config/database.yml`.

Utilizando os comandos a abaixo você irá instalar as gems, criar o banco de dados e as tabelas.

```
bundle install
rails db:create
rails db:migrate
```

Para rodar o projeto na porta 3000, execute o comando:

```
rails s
```

## API de Clientes

### Visualizar cliente

```
GET /customers/:id
```

Requisição

```
curl --location --request GET 'localhost:3000/customers/1'
```

Retorno

```json
{
  "id":  1,
  "document":  "33.660.344/0001-86",
  "full_name":  "Empresa Finttech LTDA",
  "created_at":  "2021-07-09T17:31:41.243Z",
  "updated_at":  "2021-07-09T17:31:41.243Z"
}
```

### Criar cliente

```
POST /customers
```

| parâmetro  | tipo   | tamanho |
|------------|--------|---------|
|  document  | string |    18   |
|  full_name | string |    255  |

Requisição

```
curl --location --request POST 'localhost:3000/customers' \
     --form 'customer[document]="33.660.344/0001-86"' \
     --form 'customer[full_name]="Empresa Finttech LTDA"'
```

Retorno

```json
{
  "id":  1,
  "document":  "33.660.344/0001-86",
  "full_name":  "Empresa Finttech LTDA",
  "created_at":  "2021-07-09T17:31:41.243Z",
  "updated_at":  "2021-07-09T17:31:41.243Z"
}
```

### Editar cliente

```
PATCH /customers/:id
```

| parâmetro  | tipo   | tamanho |
|------------|--------|---------|
|  document  | string |    18   |
|  full_name | string |    255  |

Requisição

```
curl --location --request PATCH 'localhost:3000/customers/1' \
     --form 'customer[full_name]="Empresa Finttech LTDA"'
```

Retorno

```json
{
  "id":  1,
  "document":  "33.660.344/0001-86",
  "full_name":  "Empresa Finttech LTDA",
  "created_at":  "2021-07-09T17:31:41.243Z",
  "updated_at":  "2021-07-09T17:31:41.243Z"
}
```

### Excluir cliente

```
DELETE /customers/:id
```

Requisição

```
curl --location --request DELETE 'localhost:3000/customers/1'
```

Retorno

```
No content
```

## API de Empréstimos

### Listar empréstimos do cliente

```
GET /customers/:customer_id/loans
```

Requisição

```
curl --location --request GET 'localhost:3000/customers/1/loans'
```

Retorno

```json
[
  {
    "id": 1,
    "customer_id": 1,
    "amount": "10000.0",
    "monthly_rate": "0.02",
    "months": 12,
    "installment": "945.6",
    "created_at": "2021-07-10T01:15:53.434Z",
    "updated_at": "2021-07-10T01:15:53.434Z"
  }
]
```

### Visualizar empréstimo do cliente

```
GET /customers/:customer_id/loans/:id
```

Requisição

```
curl --location --request GET 'localhost:3000/customers/1/loans/1'
```

Retorno

```json
{
  "id": 1,
  "customer_id": 1,
  "amount": "10000.0",
  "monthly_rate": "0.02",
  "months": 12,
  "installment": "945.6",
  "created_at": "2021-07-10T01:15:53.434Z",
  "updated_at": "2021-07-10T01:15:53.434Z"
}
```

### Criar empréstimo do cliente

```
POST /customers/:customer_id/loans
```

| parâmetro     | tipo    | tamanho  |
|---------------|---------|----------|
|  customer_id  | integer |    -     |
|  amount       | decimal |    14,2  |
|  monthly_rate | decimal |    12,4  |
|  months       | integer |    -     |

Requisição

```
curl --location --request POST 'localhost:3000/customers/1/loans' \
     --form 'loan[amount]="10000"' \
     --form 'loan[monthly_rate]="0.02"' \
     --form 'loan[months]="12"' \
     --form 'loan[customer_id]="1"'
```

Retorno

```json
{
  "id": 1,
  "customer_id": 1,
  "amount": "10000.0",
  "monthly_rate": "0.02",
  "months": 12,
  "installment": "945.6",
  "created_at": "2021-07-10T01:15:53.434Z",
  "updated_at": "2021-07-10T01:15:53.434Z"
}
```
