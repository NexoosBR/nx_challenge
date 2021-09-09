# README

## Nexoos Challenge

#### Run application
```
bundle install

rails s
```

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

## API Documentation
[Veja mais detalhes na documentação](https://documenter.getpostman.com/view/651209/U16jN6Nw)


