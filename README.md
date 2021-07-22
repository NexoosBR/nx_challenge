# README

Nexoos Challenge

Seu desafio será completar o desenvolvimento dessa API capaz de gerir empréstimos, salvando informações necessárias do cliente para podermos realizar o cálculo do valor da parcela (PMT), além de haver a possibilidade de leitura desses dados pelo cliente.
---

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

---

Documentation about the system
---

API capable of managing loans, saving the client's necessary information so that we can calculate the installment value (PMT), in addition to the possibility of reading this data by the client.

Have the following features with their respective versions installed on the machine:

- Ruby `2.7.2` - You can use [RBENV](https://github.com/rbenv/rbenv)
- Sqlite3 1.4
- Rails `6.1.3.2`
- Bundler `2.1.4`

## Most used gem
- gem rspec-rails - Gem for TDD testing
- gem rubocop - Gem for code analysis

## Setup the project

After you get all the [prerequisites](#prerequisites), simply execute the following commands in sequence:

```bash
1. Install the dependencies above
2. $ git clone  # Clone the project
3. $ cd nx-challenge # Go into the project folder
4. $ bundle install # Install the gem dependencies
5. $ bundle exec rspec # Run the specs to see if everything is working fine
```

## EndPoints
Post Request para Loans:

`$ curl -d '{"value":"30000", "rate":"0.02", "installment":"15"}' -H "Content-Type: application/json" -X POST http://localhost:3000/loans`


Expected Response:
```
{
  "loan": {
    "id": 1, 
    "status":"created"
  }
}
```

Get Request para Loans:

`$ curl --request GET http://localhost:3000/loans/1`

Expected Response:

```
{
  "loan": {
    "id": 1, 
    "pmt":2334.76,
    "status":"success"
  }
}

```
Note: 
- Value - Valor
- Rate - Taxa
- Installment - Parcelas
---

Thanks for the opportunity, this was made with &nbsp;by Arissonb [Get in touch!](https://www.linkedin.com/in/arissonb/)