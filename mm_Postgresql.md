# PostgreSQL

> O [PostgreSQL](https://www.postgresql.org/about/ "About") é um sistema gerenciador de banco de dados objeto-relacional (SGBDOR) de código aberto (open source).

##### Alterne para a conta postgres no seu servidor digitando (**sudo -i -u postgres**):
```bash
$ sudo -i -u postgres
```

##### Agora você pode acessar o prompt do Postgres imediatamente digitando (**psql**):
```bash
$ psql
```

##### Saia do prompt do Postgres digitando (**\q**):
```bash
postgres=# \q
```

##### Acessando um prompt Postgres Sem Alternar Contas
```bash
$ sudo -u postgres psql
```

##### Conectar a um banco de dados especifico
```bash
postgres=# \connect nome_do_banco
```

##### Obter informação sobre a conexão
```bash
test=> \conninfo
```

```bash
Output:
You are connected to database "test" as user "diorgenes" via socket in "/var/run/postgresql" at port "5433".
```

##### Ver a localização do arquivo "pg_hba.conf"

```bash
postgres=# show hba_file ;
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
> $ sudo service postgresql restart
> # ou
> $ sudo systemctl restart postgresql
> ```

##### Alterar a senha do usuário
```bash
postgres=# alter user nome_do_usuario with password 'nova_senha';
```

##### Criar tabela, com auto-incremento (serial ou bigserial) e uma constraint (CHECK) já que no Postgres não tem UNSIGNED
```sql
create table professor (id serial check (id > 0), nome varchar(30) not null, salario decimal(10,2), primary key (id));
-- ou com o nome na constraint
create table professor (id serial constraint chk_id_positivo check (id > 0), nome varchar(30) not null, salario decimal(10,2), primary key (id));
```

##### Fazer backup com método SQL-dump

> pg_dump [-h] host [-p] porta [-o] (salvar identificadores OIDs) [-U] usuário [nome_do_banco] > arquivo_de_saída
>
> Referência do programa  [pg_dump](http://pgdocptbr.sourceforge.net/pg80/app-pgdump.html "documentação")

```bash
$ pg_dump -h localhost -p 5433 -o -U diorgenes diorgenes > diorgenes.sql
```

##### Restaurar cópia de segurança
```bash
$ psql nome_do_banco < arquivo_de_entrada
```

##### Documentação

* [Tutorial de Justin Ellingwood na DigitalOcean](https://www.digitalocean.com/community/tutorials/como-instalar-e-utilizar-o-postgresql-no-ubuntu-16-04-pt)
* [português](http://pgdocptbr.sourceforge.net/pg74/ddl-constraints.html)

##### Authors

* [**Diorgenes**](https://www.linkedin.com/in/diorgenes-m-silva/ "ver linkedin")
