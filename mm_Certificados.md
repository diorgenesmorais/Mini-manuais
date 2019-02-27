# Gerenciando certificado A1

### Instalação no Ubuntu
```
sudo apt install libnss3-tools openssl
```

Com a instalação do NSS ficará disponível o diretório $HOME/.pki, onde residem as configurações de certificados.


### Listar todos os certificados
```
certutil -d sql:$HOME/.pki/nssdb -L
```

_Exemplo de lista:_


| Certificate Nickname                    |                     Trust Attributes |
| :--------------------------------------- | :------------------------------------: |
|                                         |                    SSL,S/MIME,JAR/XPI |
|                                         |                                       |
|Autoridade Certificadora Raiz Brasileira v2 - ICP-Brasil |    CT,C,C |
|Autoridade Certificadora Raiz Brasileira v5 - ICP-Brasil |    CT,C,C |
|1000504242                                               |    u,u,u |


### Ver detalhes de um certificado específico
```
certutil -d sql:$HOME/.pki/nssdb -L -n <certificate nickname>
```

### Excluir um certificado
```
certutil -d sql:$HOME/.pki/nssdb -D -n <certificate nickname>
```

### Adicionar um certificado
```
certutil -d sql:$HOME/.pki/nssdb -A -t <TRUSTARGS> -n <certificate nickname> -i <certificate filename>
```

> TRUSTARGS (Trust Attributes) - são três sequências de zero ou mais caracteres alfabéticos, separados por vírgulas. Eles definem como o certificado deve ser confiável para o SSL, objeto de e-mail ou assinatura e são explicados detalhadamente nas docs certutil.
> 
> Para importar um certificado pessoal e uma chave privada armazenada em um arquivo PKCS#12. O TRUSTARGS do certificado pessoal será definido como "u, u, u".


### Exemplos: Para confiar em um certificado emitido por uma CA-Raiz sob protocolos HTTPS, use:
```
certutil -d sql:$HOME/.pki/nssdb -A -t "C, , " -n <certificate nickname> -i <certificate filename>
```

### Para confiar em um certificado auto-assinado, use:
```
certutil -d sql:$HOME/.pki/nssdb -A -t "P, , " -n <certificate nickname> -i <certificate filename>
```

### Adicionando um certificado pessoal para autenticação de cliente SSL:
```
pk12util -d sql:$HOME/.pki/nssdb -i PKCS12_file.p12
```

###### Referências:

[Blog de Brito](http://brito.blog.incolume.com.br/2010/12/gerenciando-certificados-a1-fornecidos.html)

[No Viva o Linux pelo mesmo autor - Ricardo Brito do Nascimento](https://www.vivaolinux.com.br/artigo/Gerenciando-certificados-A1-fornecidos-pelo-ICBBrasil-no-navegador-Chrome-sobre-Linux/?pagina=1)


