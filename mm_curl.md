## exemplo de uso: curl
======================

## POST
` Obter OAuth token (API REST):
	curl -H "Authorization: Basic YW5ndWxhcjpAbmd1bEByMA==" -H "Content-Type: application/x-www-form-urlencoded" -d "client=angular&username=admin&password=admin&grant_type=password" http://localhost:8080/oauth/token | python -m json.tool

## GET
` consultar Lançamentos com um token (retornado na consulta anterior)
	curl -H "Authorization:Bearer 2f0ccdd9-cdb7-47e6-9c82-527d4656edd4" localhost:8080/lancamentos | python -m json.tool

` Dicas:
	https://gist.github.com/subfuzion/08c5d85437d5d4f00e58

@author Diorgenes Morais
@version 1.0.0
∆2017
