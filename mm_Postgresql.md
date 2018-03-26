# PostgreSQL

> O [PostgreSQL](https://www.postgresql.org/about/ "About") é um sistema gerenciador de banco de dados objeto-relacional (SGBDOR) de código aberto (open source).

##### Alterne para a conta postgres no seu servidor digitando (**sudo -i -u postgres**):
```bash
sudo -i -u postgres
```

##### Agora você pode acessar o prompt do Postgres imediatamente digitando (**psql**):
```bash
psql
```

##### Acessar um banco apartir do terminal (permissões do usuário logado no terminal)
```bash
# se o username não for informado será usado o usuário do terminal
psql [-d] databaseName [username]
```

##### Acessando um prompt Postgres sem alternar contas (conecta ao banco "postgres" com usuário "postgres")
```bash
sudo -u postgres psql
```

##### Exemplos de prompts
> ```bash
> # prompt do superusuário
> postgres=#
> # prompt de usuário
> postgres=>
> ```

```bash
\connect nome_do_banco
# ou, simplesmente
\c nome_do_banco
# se não informar o nome do banco retorna qual usuário está conectado no banco atual
\c
```

##### Obter informação sobre a conexão
```bash
\conninfo
```

```bash
Output:
You are connected to database "test" as user "diorgenes" via socket in "/var/run/postgresql" at port "5433".
```

##### Alterar a senha do usuário
```sql
alter user nome_do_usuario with password 'nova_senha';
```

##### Alguns comandos úteis
```bash
# Ajuda - exibe uma lista de comandos
\?
# Listar os bancos de dados
\l
# Listar tabelas (semelhante ao show tables)
\dt
# Sair do PostgreSQL
\q
```

* #### _Configurações_

##### Ver a localização do arquivo "pg_hba.conf" (é preciso está conectado como superusuário)
(observar o prompt - a tralha - postgres=#)
```
show hba_file ;
```
* Resultado:

```bash
              hba_file               
-------------------------------------
/etc/postgresql/10/main/pg_hba.conf
(1 row)
```

##### Mudar o método de autenticação de md5 para password

```bash
# TYPE  DATABASE        USER            ADDRESS                 METHOD

# "local" is for Unix domain socket connections only
local   all             all                                     peer
# IPv4 local connections:
host    diorgenes       diorgenes       127.0.0.1/32            password
# IPv6 local connections:
host    all             all             ::1/128                 md5
# Allow replication connections from localhost, by a user with the
# replication privilege.
local   replication     all                                     peer
host    replication     all             127.0.0.1/32            md5
host    replication     all             ::1/128                 md5
```

> Reiniciar o serviço (postgresql)
>
> ```bash
> sudo service postgresql restart
> # ou
> sudo systemctl restart postgresql
> ```

* #### _Alguns comandos SQL_

##### Criar tabela, com auto-incremento (serial ou bigserial) e uma constraint (CHECK) já que no Postgres não tem UNSIGNED
```sql
create table professor (id serial check (id > 0), nome varchar(30) not null, salario decimal(10,2), primary key (id));
-- ou com o nome na constraint
create table professor (id serial constraint chk_id_positivo check (id > 0), nome varchar(30) not null, salario decimal(10,2), primary key (id));
```

* #### _Backup_

##### Fazer backup com método SQL-dump

> pg_dump [-h] host [-p] porta [-o] (salvar identificadores OIDs) [-U] usuário [nome_do_banco] > arquivo_de_saída
>
> Referência do programa  [pg_dump](http://pgdocptbr.sourceforge.net/pg80/app-pgdump.html "documentação")

```bash
pg_dump -h localhost -p 5433 -o -U diorgenes diorgenes > diorgenes.sql
```

##### Restaurar cópia de segurança
```bash
psql nome_do_banco < arquivo_de_entrada
```

##### Documentação

* [Tutorial de Justin Ellingwood na DigitalOcean](https://www.digitalocean.com/community/tutorials/como-instalar-e-utilizar-o-postgresql-no-ubuntu-16-04-pt)
* [Documentação do PostgreSQL 7.4.1](http://pgdocptbr.sourceforge.net/pg74/ddl.html)
* [Documentação do PostgreSQL 8.2.0](http://pgdocptbr.sourceforge.net/pg82/index.html)

##### Authors

* [**Diorgenes Morais**](https://www.linkedin.com/in/diorgenes-m-silva/ "ver linkedin")
