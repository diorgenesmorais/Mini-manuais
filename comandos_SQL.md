SQL
=======

> Este manual foi baseado no MySql, embora alguns comandos são comuns a outros SGBDs.
>
> O que estiver dentro de [chaves] é opcional. (Não é obrigatório)

-------------------------------
>DDL - Data Definition Language
>
	Summary:
>
>	- CREATE
>	- ALTER
>	- DROP

-------------------------------

>* **CREATE** - Criar um banco de dados

```sql
CREATE DATABASE name_schema [DEFAULT CHARACTER SET utf8] [DEFAULT COLLATE utf8_general_ci];
```

>* **ALTER SCHEMA**

```sql
ALTER SCHEMA `dms`  [DEFAULT CHARACTER SET utf8]  [DEFAULT COLLATE utf8_general_ci];
```

>* **CREATE** - Criar uma estrutura

```sql
-- Definir o ENGINE e o CHARSET é importante quando não possível definir ao SCHEMA. (Alguns casos de uso na nuvem)
CREATE TABLE tablename (id bigint UNSIGNED NOT NULL AUTO_INCREMENT, PRIMARY KEY (id)) [ENGINE=InnoDB] [DEFAULT CHARSET=utf8];

-- OR

CREATE TABLE tablename (id bigint UNSIGNED PRIMARY KEY AUTO_INCREMENT) ENGINE=InnoDB;
```

>* **ALTER** - Alterar uma estrutura

```sql
ALTER TABLE tablename ADD COLUMN columnName typeData NOT NULL;
```

>* Adicionar uma coluna em uma posição especifica (No caso: depois da coluna de referência)

```sql
ALTER TABLE tablename ADD COLUMN columnName typeData AFTER reference_column;
```

>* Adicionar uma coluna na primeira posição

```sql
ALTER TABLE tablename ADD COLUMN columnName typeData FIRST;
```

>* Modificando definições

```sql
ALTER TABLE tablename CHANGE COLUMN columnName otherColumnName typeData;
```

>* o tipo da coluna e as constraint, Exceção: não pode modificar o nome da coluna

```sql
ALTER TABLE tablename MODIFY COLUMN columnName typeData;
```

>* **INDEX simples**

```sql
CREATE INDEX index_name ON table_name(column_name(16));
```

```sql
ALTER TABLE tablename ADD INDEX [index_name] (column_name);

-- OR

ALTER TABLE tablename ADD INDEX [index_name] (column_name(16));
```

>* **INDEX composto**

```sql
ALTER TABLE tablename ADD INDEX [index_name] (column_name, column_other);
```

>* **UNIQUE ADD**

```sql
ALTER TABLE table_name ADD UNIQUE [UK_unique_name] (column_name);
```

>* **UNIQUE DROP**

```sql
ALTER TABLE table_name DROP UNIQUE UK_unique_name;
```

>* **FOREIGN KEY**

```sql
ALTER TABLE table_name ADD CONSTRAINT FK_foreign_name FOREIGN KEY (column_id) REFERENCES table_name(id);
```

>* **DELETE NUMBER OF AUTO_INCREMENT**

```sql
ALTER TABLE table_name Auto_increment = ?
```

>* **DROP** - Excluir uma estrutura

```sql
DROP TABLE tablename;
```

>* **RENAME** - Renomear

```sql
RENAME TABLE nome_antigo TO novo_nome;

-- ou

ALTER TABLE tablename RENAME TO newTableName;
```

>* Apagar todos os dados de uma tabela

```sql
TRUNCATE TABLE tablename;

-- ou

TRUNCATE tablename;
```

-------------------------------------
>**DML** - Data Manipulation Language
>
	Summary:
>
>	* INSERT
>	* UPDATE
>	* DELETE
> * CALL
> * EXPLAIN PLAN
> * LOCK TABLES
>

-------------------------------------
>* **INSERT**

```sql
INSERT INTO tablename (id, column_name) VALUES (null, 'value');

-- ou

INSERT INTO tablename (DEFAULT, 'value');
```

>* **UPDATE**

```sql
UPDATE tablename SET column_name = 'value' WHERE id=?;
```

>* em mais de uma coluna

```sql
UPDATE tablename SET column_name_1 = 'value', column_name_2 = 'value' WHERE id = ?;
```

>* Limitando a atualização a um registro apenas

```sql
UPDATE tablename SET column_name_1 = 'value', column_name_2 = 'value' WHERE id = ? LIMIT 1;
```

>* Paginação: **limit**: offiset, row_count - limit: começa, qtde_de_linhas

```sql
UPDATE tablename SET column_name_1 = 'value', column_name_2 = 'value' WHERE id = ? LIMIT 0, 1;
```

>* **DELETE**

```sql
DELETE FROM tablename WHERE id=?;
```

>* **EXPLAIN**

```sql
-- similar ao DESCRIBE
explain extended select * from tablename;

explain tablename;
-- o mesmo que
desc tablename;
```

>* **LOCK TABLES**
>
>```
> LOCK TABLES
>    tbl_name [[AS] alias] lock_type
>    [, tbl_name [[AS] alias] lock_type] ...
>
>lock_type:
>    READ [LOCAL]
>  | [LOW_PRIORITY] WRITE
>
>UNLOCK TABLES
>```
>
>[See more...](https://dev.mysql.com/doc/refman/8.0/en/lock-tables.html "Veja mais sobre MySql")

```sql
-- trava para leitura
lock tables tablename read;
```

-----------------------------------
>**DQL** - Data Query Language || **DRL** - Data Retrieve Language
>
	Summary:
>
>	- SELECT

-----------------------------------
>* **SELECT**

```sql
SELECT * FROM table_name;
```

>* Ordem crescente por uma determinada coluna

```sql
SELECT * FROM table_name ORDER BY column_name [ASC];
```

>* Ordem decrescente

```sql
SELECT * FROM table_name ORDER BY column_name DESC;
```

>* Filtrar por linha - **GET RESULT SET**

```sql
SELECT * FROM table_name WHERE pela_coluna = 'dado' ORDER BY column_name;
```

>* Operadores de comparação: <, >, <=, >=, !=, <>

```sql
SELECT * FROM table_name WHERE column <> 'dado';
```

>* Onde o valor esteja em uma faixa de valores (entre um valor E outro valor) - intervalo

```sql
SELECT * FROM table_name WHERE column BETWEEN '10' AND '50';
```

>* Onde o valor seja especifico (dentro de) - lista

```sql
SELECT * FROM table_name WHERE column IN ('valor1', 'valor2');
```

>* Operador **LIKE** com uso de coringa (**%**)

```sql
SELECT * FROM table_name WHERE column LIKE '%';
```

>* Negando o operador **LIKE**

```sql
SELECT * FROM table_name WHERE column NOT LIKE '%';
```

>* Exigir que tenha um caractere (underline = **_**)

```sql
SELECT * FROM table_name WHERE column LIKE '%_';
```

>* Filtrar com **DISTINCT**

```sql
SELECT DISTINCT column FROM table_name;
```

>* Agrupar por (**GROUP BY**)

```sql
SELECT column1 FROM table_name GROUP BY column1;
```

>* Agregar (**HAVING**)

```sql
SELECT column1 FROM table_name GROUP BY column1 HAVING count(column1) > 3;

-- ou

SELECT column1 FROM table_name GROUP BY column1 HAVING column1 > (SELECT AVG(column1) FROM table_name);
```

>* Funções de agregação

```sql
SELECT COUNT(*) FROM table_name;
```

>* Qual o valor máximo

```sql
SELECT MAX(column) FROM table_name;
```

>* Somar

```sql
SELECT SUM(column) FROM table_name;
```

>* Média

```sql
SELECT AVG(column) FROM table_name;
```

>* **INNER JOIN** - junção interna - exibe só os dados que combinarem

```sql
SELECT a.column, b.column FROM table_name AS a INNER JOIN table_name AS b ON a.fk_id = b.id;
```

>* junção interna com 3 tabelas

```sql
SELECT a.column, o.column FROM table_name a INNER JOIN table_intermediaria i ON i.a_id=a.id INNER JOIN outra_table o ON o.id=i.o_id;
```

>* **LEFT OUTER JOIN** - exibe preferêncialmente os dados da tabela a esquerda

```sql
SELECT a.column, b.column FROM table_name AS a LEFT OUTER JOIN table_name AS b ON a.fk_id = b.id;
```

>* **RIGHT OUTER JOIN** - exibe preferêncialmente os dados da tabela da direita

```sql
SELECT a.column, b.column FROM table_name AS a RIGHT OUTER JOIN table_name AS b ON a.fk_id = b.id;
```

------------------------------
>**DCL** - Data Control Language
>
	Summary:
>
>	- GRANT - habilitar acesso a dados e operações
>	- REVOKE - revogar acesso a dados e operações

-------------------------------------
>Execultar um [script](http://ftp.nchu.edu.tw/MySQL/doc/refman/4.1/pt/batch-commands.html "ver com mais detalhes") dentro do MySql

```bash
SOURCE filename;
```

>**CREATE USER** - Criar usuário
>
>* Allowed to access locally
>```sql
>CREATE USER 'username'@'localhost' IDENTIFIED BY 'password';
>```
>
>* Allowed access anywhere
>```sql
>CREATE USER 'username'@'%' IDENTIFIED BY 'password';
>```
>**DROP USER** - Excluir usuário
>```sql
>DROP USER 'username'@'%';
>```
>
>**GRANT** - Habilitar acesso
>
>* Criar e conceder privilégio a um usuário:
>```sql
>GRANT ALL PRIVILEGES ON *.* TO 'username'@'%' IDENTIFIED BY 'password';
>--or
>GRANT SELECT, INSERT, UPDATE, DELETE ON dms.* TO 'username'@'localhost' IDENTIFIED BY 'password';
>```
>
>**REVOKE** - Revogar acesso
>
>* Revogar privilégios a um usuário:
>```sql
>REVOKE ALL PRIVILEGES ON *.* FROM 'user'@'localhost';
>```

------------------------------------
>**DTL** - Data Transaction Language || **TCL** - Transaction Control Language
>
	Summary:
>
>	- inicia a transação
>```bash
>START TRANSACTION
>```
>	- concretiza a transação
>```bash
>COMMIT
>```
>	- anula a última transação
>```bash
>ROLLBACK
>```

#### Authors

* **Diorgenes Morais**
