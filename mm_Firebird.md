# Firebird

##### Modificar senha do SYSDBA

> Acessar pelo prompt (cmd) o diretório BIN do Firebird
>
> cd “C:\Arquivos de programas\Firebird\Firebird_2_5\bin”
>
> Logar ao GSEC


```command
gsec -user sysdba -password masterkey
```

> Após logado, digitar uma nova senha (newpasswd)

```command
GSEC> modify sysdba -pw newpasswd
```

###### Digite interrogação para obter ajuda
```command
GSEC> ?
```

##### Criar um banco (ex: no Windows)
```command
create database 'c:\pasta_destino\NOME_DO_BANCO.FDB' user 'sysdba' password 'masterkey';
```

##### Conectar a uma base de dados
```command
connect 'c:\pasta_destino\NOME_DO_BANCO.FDB' user 'sysdba' password 'masterkey';
```

##### Criar uma tabela
```command
create table clientes (id integer not null, nome varchar(30));
```

##### Listar as tabelas do banco
```command
show tables;
```

##### Ver a estrutura de uma tabela (clientes)
```command
show table clientes;
```

> Usar o ISQL a partir do Ubuntu

##### Instalar o utilitário isql-fb
```bash
sudo apt install firebird3.0-utils
```

##### Conectar a um banco usando o console do Ubuntu
```bash
isql-fb
```
