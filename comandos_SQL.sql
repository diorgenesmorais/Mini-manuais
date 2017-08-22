
-- DDL - Data Definition Language
	-- Summary:
	-- CREATE
	-- ALTER
	-- DROP

	-- CREATE - Criar um banco de dados
	CREATE DATABASE name_schema DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;
	-- ALTER SCHEMA
	ALTER SCHEMA `dms`  DEFAULT CHARACTER SET utf8  DEFAULT COLLATE utf8_general_ci;

	-- CREATE - Criar uma estrutura
	CREATE TABLE tablename (id bigint UNSIGNED NOT NULL AUTO_INCREMENT, PRIMARY KEY (id)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
	-- OR
	CREATE TABLE tablename (id bigint UNSIGNED PRIMARY KEY AUTO_INCREMENT) ENGINE=InnoDB;
	-- ALTER - Alterar uma estrutura
	ALTER TABLE tablename ADD COLUMN columnName typeData NOT NULL;

	-- Adicionar uma coluna em uma posição especifica
	ALTER TABLE tablename ADD COLUMN columnName typeData AFTER column_de_re	ferencia;
	-- Adicionar uma coluna na primeira posição
	ALTER TABLE tablename ADD COLUMN columnName typeData FIRST;

	-- Modificando definições
	ALTER TABLE tablename CHANGE COLUMN columnName otherColumnName typeData;
	-- o tipo da coluna e as constraint, Exceção: não pode modificar o nome da coluna
	ALTER TABLE tablename MODIFY COLUMN columnName typeData;

	-- INDEX simples
	CREATE INDEX index_name ON table_name(column_name(16));

	ALTER TABLE tablename ADD INDEX index_name (column_name);
	-- OR
	ALTER TABLE tablename ADD INDEX index_name (column_name(16));
	-- INDEX composto
	ALTER TABLE tablename ADD INDEX index_name (column_name, column_other);

	-- UNIQUE ADD
	ALTER TABLE table_name ADD UNIQUE UK_unique_name (column_name);
	-- UNIQUE DROP
	ALTER TABLE table_name DROP UNIQUE UK_unique_name;

	-- FOREIGN KEY
	ALTER TABLE table_name ADD CONSTRAINT FK_foreign_name FOREIGN KEY (column_id) REFERENCES table_name(id);

	-- DELETE NUMBER OF AUTO_INCREMENT
	ALTER TABLE table_name Auto_increment = ?

	-- DROP - Excluir uma estrutura
	DROP TABLE tablename;
	-- RENAME - Renomear
	RENAME TABLE nome_antigo TO novo_nome;
	-- ou
	ALTER TABLE tablename RENAME TO newTableName;

-- DML - Data Manipulation Language
	-- Summary:
	-- INSERT
	-- UPDATE
	-- DELETE

	-- INSERT
	INSERT INTO tablename (id, column_name) VALUES (null, 'value');
	-- ou
	INSERT INTO tablename (DEFAULT, 'value');

	-- UPDATE
	UPDATE tablename SET column_name = 'value' WHERE id=?;
	-- em mais de uma coluna
	UPDATE tablename SET column_name_1 = 'value', column_name_2 = 'value' WHERE id = ?;
	-- Limitando a atualização a um registro apenas
	UPDATE tablename SET column_name_1 = 'value', column_name_2 = 'value' WHERE id = ? LIMIT 1;
	-- Paginação: limit: offiset, row_count - limit: começa, qtde_de_linhas
	UPDATE tablename SET column_name_1 = 'value', column_name_2 = 'value' WHERE id = ? LIMIT 0, 1;

	-- DELETE
	DELETE FROM tablename WHERE id=?;

	-- Apagar todos os dados de uma tabela
	TRUNCATE TABLE tablename;
	-- ou
	TRUNCATE tablename;

-- DQL - Data Query Language
	-- Summary:
	-- SELECT

	-- SELECT
	SELECT * FROM table_name;
	-- Ordem crescente por uma determinada coluna
	SELECT * FROM table_name ORDER BY column_name [ASC];
	-- Ordem decrescente
	SELECT * FROM table_name ORDER BY column_name DESC;
	
	-- Filtrar por linha - GET RESULT SET
	SELECT * FROM table_name WHERE pela_coluna = 'dado' ORDER BY column_name;
	-- Operadores de comparação: <, >, <=, >=, !=, <>
	SELECT * FROM table_name WHERE column <> 'dado';
	-- Onde o valor esteja em uma faixa de valores (entre um valor E outro valor) - intervalo
	SELECT * FROM table_name WHERE column BETWEEN '10' AND '50';
	-- Onde o valor seja especifico (dentro de) - lista
	SELECT * FROM table_name WHERE column IN ('valor1', 'valor2');
	-- Operador LIKE com uso de coringa (%)
	SELECT * FROM table_name WHERE column LIKE '%';
	-- Negando o operador LIKE
	SELECT * FROM table_name WHERE column NOT LIKE '%';
	-- Exigir que tenha um caractere (underline = _)
	SELECT * FROM table_name WHERE column LIKE '%_';
	-- Filtrar com DISTINCT
	SELECT DISTINCT column FROM table_name;
	
	-- Agrupar (juntar)
	SELECT column1 FROM table_name GROUP BY column1;
	-- Agregar
	SELECT column1 FROM table_name GROUP BY column1 HAVING count(column1) > 3;
	-- ou
	SELECT column1 FROM table_name GROUP BY column1 HAVING column1 > (SELECT AVG(column1) FROM table_name);

	-- Funções de agregação
	SELECT COUNT(*) FROM table_name;
	-- Qual o valor máximo
	SELECT MAX(column) FROM table_name;
	-- Somar
	SELECT SUM(column) FROM table_name;
	-- Média
	SELECT AVG(column) FROM table_name;

	-- INNER JOIN - junção interna - exibe só os dados que combinarem
	SELECT a.column, b.column FROM table_name AS a INNER JOIN table_name AS b ON a.fk_id = b.id;
    -- junção interna com 3 tabelas
    SELECT a.column, o.column FROM table_name a INNER JOIN table_intermediaria i ON i.a_id=a.id INNER JOIN outra_table o ON o.id=i.o_id;
	-- LEFT OUTER JOIN - exibe preferêncialmente os dados da tabela a esquerda
	SELECT a.column, b.column FROM table_name AS a LEFT OUTER JOIN table_name AS b ON a.fk_id = b.id;
	-- RIGHT OUTER JOIN - exibe preferêncialmente os dados da tabela da direita
	SELECT a.column, b.column FROM table_name AS a RIGHT OUTER JOIN table_name AS b ON a.fk_id = b.id;


-- DCL - Data Control Language
	-- Summary:
	-- GRANT - habilitar acesso a dados e operações
	-- REVOKE - revogar acesso a dados e operações

	-- Execultar um script dentro do MySql (http://ftp.nchu.edu.tw/MySQL/doc/refman/4.1/pt/batch-commands.html)
	SOURCE filename;

	-- CREATE USER - Criar usuário
	-- Allowed to access locally
	CREATE USER 'username'@'localhost' IDENTIFIED BY 'password';

	-- Allowed access anywhere
	CREATE USER 'username'@'%' IDENTIFIED BY 'password';

	-- DROP USER - Excluir usuário
	DROP USER 'username'@'%';

	-- GRANT - Habilitar acesso
	-- Criar e conceder privilégio a um usuário :
	GRANT ALL PRIVILEGES ON *.* TO 'username'@'%' IDENTIFIED BY 'password';

	GRANT SELECT, INSERT, UPDATE, DELETE ON dms.* TO 'username'@'localhost' IDENTIFIED BY 'password';

	-- REVOKE - Revogar acesso
	-- Revogar privilégios a um usuário :
	REVOKE ALL PRIVILEGES ON *.* FROM 'user'@'localhost';

-- DTL - Data Transaction Language
	-- Summary:
	-- START TRANSACTION - inicia a transação
	-- COMMIT - concretiza a transação
	-- ROLLBACK - anula a transação
