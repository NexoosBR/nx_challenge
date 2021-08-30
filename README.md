# Nexoos Challenge

Desafio de desenvolvimento de software para a Nexoos.
O desafio consiste na criação de um sistema de gerenciamento de empréstimos. Usando o calculo de **pmt** para retornar o valor das parcelas.

## Inicinado

Clone esse repositório

```bash
git clone https://github.com/wagnerdevocelot/nx_challenge.git
```
Na raiz do repositório, rode todos esses comandos para instalar o ambiente de desenvolvimento e subir o servidor na porta 3000.

```bash
bundle install; rails db:create; rails db:migrate; rails s
```

## Referencias da API

#### Loan (endpoint)

[![API Status](https://img.shields.io/badge/POST-loans-blue.svg)]()

Aqui você pode criar um empréstimo.

```bash
/api/v1/loans
```
payload:

```json
{
  "present_value": 100,
  "tax": 2
}
```

Nome   | Descrição | Tipo
--------- | ------  | --------
**present_value** | Valor do empréstimo | decimal
**tax** | Taxa de juros | decimal



[![API Status](https://img.shields.io/badge/GET-loans-blue.svg)]()

```bash
/api/v1/loans/{id}
```
raw_data:

```jSON
{
  "loan": {
    "id": 1,
    "pmt": "9.46"
  }
}
```

Nome   | Descrição | Tipo
--------- | ------  | --------
**id** | identificador do empréstimo | primary key
**pmt** | valor da parcela | decimal

## Testes e qualidade do código

Para testar o código, rode o comando abaixo.

```bash
rspec
```

Para ver os resultados de cobertura do código, rode o comando abaixo.

```bash
open coverage/index.html
```

Para ver os resultados de qualidade de código como code smells, testes, lint, duplicidade e complexidade, rode o comando abaixo.

```bash
rubycritic
```

## Créditos

Wagner Abrantes de Oliveira
[linkedin](https://www.linkedin.com/in/vapordev/)
[wagner1337.py@gmail.com](mailto:wagner1337.py@gmail.com)

