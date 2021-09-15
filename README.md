# README

## Nexoos Challenge

Possível solução para o desafio proposto da Nexoos.

A aplicação consiste em uma api onde o usuário pode, via métodos HTTP POST e GET, inserir e ler dados relacionados a empréstimos.\
Ao chamar o método POST passando os parametros corretos, é feito o cálculo do valor das parcelas(PMT) referente ao empréstimo gerado, e então esse empréstimo é salvo no bando de dados.\
O método GET retorna o identificador do empréstimo solicitado e o valor das parcelas do mesmo.

A renderização é feita utilizando o próprio render do ActionController, pois a mensagem de retorno é pequena (a primeira opção foi a gem active_model_serializer).

O banco de dados utilizado é o sqlite (já configurado na aplicação base).
Para os testes, é utilizado o framework Rspec em conjunto com outras gems de suporte (factory_bot_rails, database_cleaner), e a gem simplecov, que gera dados sobre a cobertura dos testes (resultado em coverage/index.html).

Também são utilizadas a gem rack-cors, que possibilita limitar o acesso de aplicações consumidoras a métodos específicos da api, e a gem rack-attack, que permite limitar a quantidade de requisições por tempo para cada método da api.

Antes de iniciar a aplicação, será necessário instalar/atualizar as gems necessárias, e preparar o banco de dados. Para isso, abra um terminal na pasta raiz e insira os comandos abaixo.

Instalar/Atualizar as dependências:
```
bundle install
```

Criar o banco de dados:
```
rails db:create
```

Gerar a tabela e as colunas necessárias:
```
rails db:migrate
```

Por fim, iniciar a aplicação:
```
rails s
```

____
Abaixo é utilizado o curl para testar aplicação.\
Gerando um empréstimo com valor total de 2500, uma taxa de 1.6, com um total 12 de prestações:
```
curl --request POST http://localhost:3000/v1/loans -d \
"valor=2500&\
taxa=1.6&\
nprestacoes=12"
```

Visualizando o valor da parcela gerada:
```
curl --request GET http://localhost:3000/v1/loans/1
```

O retorno do GET será:
```
{ 
  "loan": {
      "id": 1, "pmt": 230.63
  }
}
```

__________________

Para mais referências sobre as gems utilizadas:\
[rack-attack](https://github.com/rack/rack-attack)\
[raco-cors](https://github.com/cyu/rack-cors)\
[facory_bot_rails](https://github.com/thoughtbot/factory_bot_rails)\
[database_cleaner](https://github.com/DatabaseCleaner/database_cleaner)\
[simplecov](https://github.com/simplecov-ruby/simplecov)

______________________
Descrição do desafio: https://github.com/NexoosBR/nx_challenge