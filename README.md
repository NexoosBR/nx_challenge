### README
  Nexoos Challenge

Seu desafio será completar o desenvolvimento dessa API capaz de gerir empréstimos, salvando informações necessárias do cliente para podermos realizar o cálculo do valor da parcela (PMT), além de haver a possibilidade de leitura desses dados pelo cliente.

Deve-se:

 - Modelar o banco de dados parar ter os dados necessários do cálculo da PMT
 - Completar as rotas `POST /loans` e `GET /loans/ID`, alterando a API para escrever e retornar dados do banco de dados.
 - Na escrita, deve-se calcular o valor da parcela (PMT) e salvar no banco de dados.

##### Pré-requisitos:
 
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
##### Descrição geral do cenário

1. Analise do Problema
2. Modelagem e criação dos testes utilizando TDD e Rspec.
3. Criando Controller, models e regra de negócio para calculo de pmt.

## Concerns e observações :thought_balloon:
<!-- Pontos importantes e que merecem atenção -->

## Ao deployar :ship:
<!-- Informar se existir algo importante para a etapa de deploy -->
