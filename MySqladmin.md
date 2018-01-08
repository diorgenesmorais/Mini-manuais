# mysqladmin

>Alguns comandos últeis com mysqladmin

- verificar se o Mysql está ativo:

```bash
mysqladmin -u root -p ping
```

>resultado:
>
>```bash
>mysql is alive
>```

- ver a versão do mysql:

```bash
mysqladmin -u root -p version
```

- verificar o status:

```bash
mysqladmin -u root -p status
```

- check the status (Ubuntu)

```bash
sudo service mysql status
```

- mostrar informações das variaveis do mysql:

```bash
mysqladmin -u root -p variable
```

- mostrar mais detalhes além das variaveis:

```bash
mysqladmin -u root -p extended-status
```

- Criar uma instância de banco de dados (schema)

```bash
mysqladmin -u root -p create database_name
```

- Remover uma instância de banco de dados (schema)

```bash
mysqladmin -u root -p drop database_name
```

- Listar os processos abertos:

```bash
mysqladmin -u root -p processlist
```

>Resultado do comando acima:


 Id | User   | Host            | db  | Command | Time | State | Info             
----|--------|-----------------|-----|---------|------|-------|------------------
 26 | vendas | localhost:57068 | dms | Sleep   | 11   |       |                  
 28 | root   | localhost       |     | Query   | 0    | init  | show processlist 


- Matar um processo pelo id da lista anterior:

```bash
mysqladmin -u root -p kill <id>
```

- Mudar a senha do usuário:

```bash
mysqladmin -u root -p password novaSenha
```

- Parar o mysql:

```bash
mysqladmin -u root -p shutdown
```

- é possivel encadear vários comandos:

```bash
mysqladmin -u root -p processlist status

# ou

mysqladmin -u root -p proc stat
```

- Repetir o comando por um tempo determinado:

```bash
mysqladmin -u root -p stat --sleep=2 --count=3
```

- Help

```bash
mysqladmin --help
```


