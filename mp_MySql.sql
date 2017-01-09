-- Manual prático MySql

-- Ajuste na configuração do Mysql
mysql_secure_installation

-- Usar Mysql pelo PROMPT (criar variável de ambiente Windows)
-- Abrar o terminal como administrador e execute o comando:
sysdm.cpl

-- Fazer backup do banco:
mysqldump -h localhost -u lau -p nome_do_banco > nome_do_backup.sql

-- Recuperar o backup:
mysql -h localhost -u lau -p nome_do_banco < nome_do_backup.sql

-- Deletar uma tabela
drop table if exists nome_tabela;

-- Limpar tabela
truncate nome_da_tabela;

-- Deletar ou Limpar uma tabela com Foreign Key (aplicar este comando antes)
set foreign_key_checks=0;

-- Verificar a definição de uma tabela: mysql>
describe nome_da_tabela;
-- ou
desc nome_da_tabela;

-- Consultar detalhes de uma tabela (inclusive o encoding): mysql>
show full columns from tablename;

-- Como saber informações da tabela, por exemplo: valor do Auto_increment
SHOW TABLE STATUS LIKE 'table_name';

-- Visualizar o código de criação da view: mysql>
show create view view_name;

-- Consultar quantas tabelas existem
show tables;

-- Consultar quantas PROCEDURES existem
show procedure status;
-- ou mais especifica (Db, Name, Type...)
show procedure status where Db = "schema_name";

-- Visualizar o código da procedure
show create procedure procedure_name

-- Acessar o MySql via SSH:
-- após acessar o servidor via SSH digitar o comando:
mysql -h ip_local_server -u user -p

-- Ver usuário logado
select current_user();

-- setar uma senha para o usuário (é preciso está logado como root)
set password for 'root'@'localhost' = password('senha');

-- Consultar o privilégio do usuário
SHOW GRANTS FOR 'username';

-- Travar a leitura de uma tabela
start transaction;
-- use: lock in share mode
select * from caixa lock in share mode;
-- enquanto não der o commit não será possivel fazer alteração na tabela
commit;

-- Consultar o encoding do schema (schemaname = nome do schema): mysql>
SELECT default_character_set_name FROM information_schema.SCHEMATA WHERE schema_name = "schemaname";

-- or
SELECT SCHEMA_NAME 'database', DEFAULT_CHARACTER_SET_NAME 'charset', DEFAULT_COLLATION_NAME 'collation' FROM information_schema.SCHEMATA;

-- Alterar o encoding do database para: CHARACTER = utf-8, COLLATE utf8_swedish_ci: mysql>
ALTER DATABASE dms CHARACTER SET utf8 COLLATE utf8_swedish_ci;

-- Consultar o encoding de uma tabela. mysql>
SELECT CCSA.character_set_name FROM information_schema.`TABLES` T,
       information_schema.`COLLATION_CHARACTER_SET_APPLICABILITY` CCSA
WHERE CCSA.collation_name = T.table_collation
  AND T.table_schema = "schemaname"
  AND T.table_name = "tablename";

-- Consultar o Engine da tabela: mysql>
-- select engine from information_schema.tables where table_schema="schema_name" and table_name="table";
select engine from information_schema.tables where table_schema="dms" and table_name="pagto";

-- Ou para exibir todas
select table_name, engine, table_collation from information_schema.tables;
