# README

Nexoos Challenge

Seu desafio será completar o desenvolvimento dessa API capaz de gerir empréstimos, salvando informações necessárias do cliente para podermos realizar o cálculo do valor da parcela (PMT), além de haver a possibilidade de leitura desses dados pelo cliente.

Deve-se:

- Modelar o banco de dados parar ter os dados necessários do cálculo da PMT
- Completar as rotas `POST /loans` e `GET /loans/ID`, alterando a API para escrever e retornar dados do banco de dados.
- Na escrita, deve-se calcular o valor da parcela (PMT) e salvar no banco de dados.

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

Documentação:
https://documenter.getpostman.com/view/10691126/TzzDJaZ8

Para rodar a API:
- Atualizar as gems 
```
  bundle install
```

- Criar e atualizar o banco de dados
```
  rails db:create
  rails db:migrate
```

- Rodar a aplicação rails
```
  rails s
```

- Rodar os testes RSpec
```
  make test
```

- Rodar a validação do lint (Rubocop)
```
  make lint ou make lint_autocorrect
```