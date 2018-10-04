# MySql

#### Manual prático

> O que estiver dentro de [chaves] é opcional.

##### Ajuste na configuração do Mysql
```bash
mysql_secure_installation
```

##### Usar Mysql pelo PROMPT (criar variável de ambiente Windows)
Abrar o terminal como administrador e execute o comando:
```
sysdm.cpl
```

##### Fazer backup do banco:
```bash
mysqldump -h localhost -u lau -p nome_do_banco > nome_do_backup.sql
```

##### Backup com as FUNCTION e PROCEDURES

> --routines - FALSE by default
>
> --triggers - TRUE by default

```bash
mysqldump --routines -u admin -p database_name > backup_name.sql
```

###### To backup only the stored procedure and triggers
```bash
mysqldump -h host -u admin -p --routines --no-create-info --no-data --no-create-db --skip-opt database_name > routines.sql
```

##### Recuperar o backup:
```
mysql -h localhost -u lau -p nome_do_banco < nome_do_backup.sql
```

##### Deletar uma tabela
```
drop table if exists nome_tabela;
```

##### Limpar tabela
```
truncate nome_da_tabela;
```

##### Deletar ou Limpar uma tabela com Foreign Key (aplicar este comando antes)
```sql
set foreign_key_checks=0;
```

##### Verificar a definição de uma tabela: mysql>
```sql
describe nome_da_tabela;
-- ou
desc nome_da_tabela;
```

##### Consultar detalhes de uma tabela (inclusive o encoding): mysql>
```sql
show full columns from tablename;
```

##### Como saber informações da tabela, por exemplo: valor do Auto_increment
```sql
SHOW TABLE STATUS LIKE 'table_name';
```

##### Visualizar o código de criação da view: mysql>
```sql
show create view view_name;
```

##### Consultar quantas tabelas existem
```sql
show tables;
```

##### Consultar quantas PROCEDURES existem
```sql
show procedure status;
-- ou mais especifica (Db, Name, Type...)
show procedure status where Db = "schema_name";
```

##### Visualizar o código da procedure
```sql
show create procedure procedure_name
```

##### Ver a configuração GLOBAL da variável SQL_MODE
```sql
show global variables like 'sql_mode';
-- ou simplesmente (V5.7)
show variables like 'sql_mode';
```

##### Acessar o MySql via SSH:
após acessar o servidor via SSH digitar o comando:
```bash
mysql -h ip_local_server -u user -p
```

##### Ver usuário logado
```sql
select current_user();
```

##### Ver qual banco está em uso
```sql
select database() [from dual];
```

##### Setar uma senha para o usuário (é preciso está logado como root)
```sql
set password for 'root'@'localhost' = password('senha');
```

##### Consultar o privilégio do usuário
```sql
SHOW GRANTS FOR 'username';
```

##### Travar a leitura de uma tabela
```sql
start transaction;
-- use: lock in share mode
select * from caixa lock in share mode;
-- enquanto não der o commit não será possivel fazer alteração na tabela
commit;
```

##### Consultar o encoding do schema (schemaname = nome do schema): mysql>
```sql
SELECT default_character_set_name FROM information_schema.SCHEMATA WHERE schema_name = "schemaname";
-- or
SELECT SCHEMA_NAME 'database', DEFAULT_CHARACTER_SET_NAME 'charset', DEFAULT_COLLATION_NAME 'collation' FROM information_schema.SCHEMATA;
```

##### Alterar o encoding do database para: CHARACTER = utf-8, COLLATE utf8_swedish_ci: mysql>
```sql
ALTER DATABASE dms CHARACTER SET utf8 COLLATE utf8_swedish_ci;
```

##### Consultar o encoding de uma tabela. mysql>
```sql
SELECT CCSA.character_set_name FROM information_schema.`TABLES` T,
       information_schema.`COLLATION_CHARACTER_SET_APPLICABILITY` CCSA
WHERE CCSA.collation_name = T.table_collation
  AND T.table_schema = "schemaname"
  AND T.table_name = "tablename";
```

##### Consultar o Engine da tabela: mysql>
```sql
-- select engine from information_schema.tables where table_schema="schema_name" and table_name="table";
select engine from information_schema.tables where table_schema="dms" and table_name="pagto";
```

##### Ou para exibir todas
```sql
select table_name, engine, table_collation from information_schema.tables;
```

##### _MySql retornando erro de "Group by" após atualização para versão 5.7_
```sql
ERROR 1140 (42000): In aggregated query without GROUP BY, expression #1 of SELECT list contains nonaggregated column...
```
###### _Caused by:_
Todos os campos que estiverem no SELECT e não estiverem utilizando funções (como COUNT, SUM, AVG...) devem estar na cláusula GROUP BY

Este erro foi reportado no [stackoverflow](https://pt.stackoverflow.com/questions/164614/mysql-retornando-erro-de-group-by-ap%C3%B3s-atualiza%C3%A7%C3%A3o-para-vers%C3%A3o-5-7)

###### _Solution:_
Seguir a orientação acima ou desabilitar o sql_mode

##### Desabilitando o sql_mode
```sql
SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
```

##### Obter status sobre conexão
```sql
-- SHOW STATUS where Variable_name like '%connect%';
show status like '%connect%';
```

##### Qtde conexões estão ativas
```sql
SHOW STATUS WHERE `variable_name` = 'Threads_connected';
```

#### **Modelos**

##### FUNCTION
```sql
drop function if exists SUBTOTAL;
delimiter $$
create function SUBTOTAL(qtde decimal(10,4), valor decimal(10,2))
  returns decimal(10,2)
  begin
  declare resultado decimal(10,2);
  set resultado = qtde * valor;
  return resultado;
  end $$
delimiter ;
```

##### Exibir script de criação da FUNCTION
```sql
show create function SUBTOTAL;
```

##### Exibir functions do banco de dados atual
```sql
show function status where Db = database();
```

##### Authores

* **Diorgenes Morais**
