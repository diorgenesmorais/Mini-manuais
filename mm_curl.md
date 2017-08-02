## Exemplo de uso: curl

## POST
` Obter OAuth token (API REST):`

	curl -H "Authorization: Basic YW5ndWxhcjpAbmd1bEByMA==" -H "Content-Type: application/x-www-form-urlencoded" -d "client=angular&username=admin&password=admin&grant_type=password" http://localhost:8080/oauth/token | python -m json.tool

` Obter refresh token usando Json Web Token (JWT) no Authorization Server`

	curl -H "Authorization: Basic YW5ndWxhcjpAbmd1bEByMA==" -H "Content-Type: application/x-www-form-urlencoded" -d "grant_type=refresh_token&refresh_token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX25hbWUiOiJhZG1pbiIsInNjb3BlIjpbInJlYWQiLCJ3cml0ZSJdLCJhdGkiOiI3NWI3NDdhYy05NjgyLTQ5ZGUtYTMzZi04YTE1MzhjZTJhNTgiLCJleHAiOjE1MDE3MTQzNDEsImF1dGhvcml0aWVzIjpbIlJPTEVfVVNFUiJdLCJqdGkiOiIwMjUwY2VmOC1lOGY1LTRkMzAtODRlMi0xZmM2ZjE3YzNlMzciLCJjbGllbnRfaWQiOiJhbmd1bGFyIn0.JlbhPX3RTNIn7XtKqYQk-EZk6K_5l-j6Q-rr7Jw4cZc" http://localhost:8080/oauth/token | python -m json.tool

## GET
` consultar Lançamentos com um token (retornado na consulta anterior)`

	curl -H "Authorization:Bearer 2f0ccdd9-cdb7-47e6-9c82-527d4656edd4" localhost:8080/lancamentos | python -m json.tool

` Dicas:`

	https://gist.github.com/subfuzion/08c5d85437d5d4f00e58

`@author Diorgenes Morais`

`@version 1.0.3`

`∆2017`
