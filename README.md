### README

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
