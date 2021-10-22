# README

## Banco de Dados

Foi criado o modelo Loan, que tem 4 campos: value (valor total), fee (taxa de juros ao ano), months (número de meses) e pmt (parcela mensal).

Todos, com exceção do número de meses, foram criados como decimals, para evitar as imprecisões de cálculos feitos com floats.

Para cálculo da PMT, foi criado um objeto de serviço, que é acionado pelo modelo antes de qualquer objeto ser salvo no banco de dados, através de um callback.

## Endpoints

A API possui dois endpoints: 'GET /loans/:id' e 'POST /loans'

GET /loans/:id

```
curl --request GET http://localhost:3000/loans/<INSERIR ID>
```

POST /loans

```
curl -X POST -d 'value=2000&months=12&fee=16' http://localhost:3000/loans
```

## Testes

Foram criados testes para o modelo Loan, para verificar se as validações simples estão funcionando e se a PMT está sendo calculada corretamente.

Os testes de controller foram substituídos por testes de requests, conforme é recomendado pela documentação do Rspec.

Para rodar os testes, basta rodar no terminal:

```
rspec
```
