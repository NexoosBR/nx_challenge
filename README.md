# Api Task manager


[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

## 🚨 importante!
É necessario docker-compose para rodar o projeto, caso queria rodar diretamente da maquina sera necessario ruby 2.7.2 e rails 6.1.3

## 🛠 Setup
Basta executar o seguinte comando:
```sh
docker-compose up -d
```
Que ira subir um container com o ruby e as gens instaladas, logo em seguida servidor puma ficara pronto.

## 💻 Usage
Primeiramente sera nescessario criar um cliente, relizando um post para /clientes podendo seguir o json abaixo 

```sh
{
	"nome": "Felipe Carlos Eduardo Fogaça",
	"email": "felipecarloseduardofogaca-97@tetrapark.com", 
	"cpf": "11705359760",
	"telefone": 988774455
}
```
Após isso poderemos realizar o post para /loans usnado o json de exemplo
```sh
{
	"pv": 999,
	"taxa_mensal": 0.028,
	"meses": 12,
	"cliente_id": 1
}
```
E para ter acesso ao pmt basta execucar um get para o /loans e você cera o resultado.
```sh
{
  "data": {
    "id": "1",
    "type": "loans",
    "attributes": {
      "pmt": "99.17"
    }
  }
}
```
