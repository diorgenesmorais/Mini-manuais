# Oracle

> **Nota**: Todos os comandos aqui apresentados foram usados no O.S. Ubuntu 16.04 com o SGBD Oracle 11.2g

##### Logar pelo terminal como usuário ORACLE (informe a senha definida na instalação)
```bash
su - oracle
```

##### Logado como Oracle conectar ao SYS como SYSDBA
```bash
sqlplus / as sysdba
```

* #### _Estando no prompt do SQL*Plus_
```bash
SQL>
```

##### Conectar o usuário ESTACIO como (AS) SYSDBA
```bash
conn estacio as sysdba
```

##### Conectar ao workspace (schema)
```bash
conn schema_name;
```

##### Ver em qual schema está conectado
```bash
show user
```

##### Criar usuário via commando
```sql
create user USERNAME identified by SENHA
```

##### Criar usuário via browser no XE 11G (usando porta padrão)

[http://localhost:8080/apex/f?p=4950]()

##### Conceder privilégio de DBA ao usuário
```sql
grant dba to USERNAME;
```

##### Conceder permissão ao usuário acessar o banco
```sql
grant connect, resource to USERNAME
```

> ##### Passos para conectar ao banco usando SQL*Plus
>
>```bash
> # logar com usuário ORACLE
> $ su - oracle
> # conectar SYSTEM como SYSDBA
> $ sqlplus SYSTEM as sysdba
> # conectar ao workspace (schema_name)
> SQL> conn workspace
> # ou com a SENHA
> SQL> conn workspace/password
>```

### **_Configurações_**

##### Ver a data atual
```sql
select sysdate from dual;
```

##### Verificar formatação atual para datas
```sql
SELECT value FROM v$nls_parameters WHERE parameter ='NLS_DATE_FORMAT';
```

##### Configurar formato de data na sessão
```sql
alter session set nls_date_format = 'DD-MM-YYYY';
```

> #### Configurar ambiente SQL*Plus

##### Mostrar e configurar AUTOCOMMIT no SQL*Plus
```sql
-- Mostrar a configuração
show autocommit
-- Ativar o autocommit
set auto on
-- Desativar o autocommit
set auto off
-- Executar o AUTOCOMMIT após 5 comandos DML
set auto 5
```

##### Personalizando o SQL*Plus, editando o arquivo glogin.sql
```bash
vi $ORACLE_HOME/sqlplus/admin/glogin.sql
```
> Tudo que for colocado no arquivo glogin.sql será executado automaticamente (sempre que iniciar uma sessão).

##### Fazer algumas configurações para sessão
```sql
-- configurar a largura do que é exibido (semelhante ao prompt)
set linesize 200
-- Ver quantas linhas estão configuradas
show linesize
-- configurar quantas linhas por página (default 14)
set pagesize 50
-- Ver quantas linhas por página está configurado
show pagesize
-- Ver todas as configurações
show all
-- Deixar a sessão case insensitive, executar esses dois comandos:
alter session set NLS_SORT=BINARY_CI;

alter session set NLS_COMP=LINGUISTIC;
```

##### Ver as configurações atuais (sessão) sobre CASE SENSITIVE [(To know more)](https://docs.oracle.com/cd/B28359_01/server.111/b28298/ch5lingsort.htm#i1008187 "Saiba mais aqui")
```sql
select * from nls_session_parameters where parameter in('NLS_COMP','NLS_SORT');
```

#### _Alguns comandos SQL_

##### Listar tabelas do usuário logado (MySql: show tables)
```sql
select * from User_Tables;
```

##### Listar tabelas pelo schema (workspace)
```sql
select * from all_tables where owner = 'nome_do_esquema'
```

##### Listar (nomes) todas as views
```sql
select object_name from all_objects where object_type = 'VIEW';
```

##### Ver detalhes sobre uma view
```sql
select * from all_objects where object_type = 'VIEW' and object_name = 'VIEW_NAME';
```

##### Descreve qual é o dono da view ()
```sql
select owner, text from all_views where view_name = 'VIEW_NAME';
```

> #### DDL - Data Definition Language
>
> CREATE, ALTER, DROP

##### Adicionar uma coluna
```sql
-- O <tipo> é varchar2, number...
alter table NOME_DA_TABELA add NOME_DA_COLUNA <tipo> <constraint>;
```

##### Alterar uma coluna da tabela
```sql
alter table NOME_DA_TABELA modify NOME_DA_COLUNA <constraint>;
-- Exemplo: modificar a coluna 'min' para que não aceite nulo
alter table produto modify min not null;
```

##### Deletar uma coluna
```sql
alter table NOME_DA_TABELA drop column NOME_DA_COLUNA;
```

##### Renomear tabela
```sql
rename NOME_DA_TABELA to NOVO_NOME;
```

##### Criar uma view
```sql
CREATE [OR REPLACE] [FORCE|NOFORCE] VIEW VIEW_NAME
  [(alias[, alias]...)]
 AS subquery
[WITH CHECK OPTION [CONSTRAINT nome_Constraint]]
[WITH READ ONLY [CONSTRAINT nome_Constraint]];
```

Cláusula        | Descrição |
--------------- | ---------------------------------------------------------
OR REPLACE      | Significa que a view deverá ser alterada, caso ela já exista.
FORCE           | Força a criação da view mesmo que as tabelas de base não existam.
NOFORCE         | (**default**) Não permite a criação da view se as tabelas de base não existirem.
VIEW_NAME       | É o nome da visão.
ALIAS           | É o apelido de uma expressão na subconsulta. Deve haver o mesmo número de apelidos do que expressções na subconsulta.
SUBQUERY        | É a subconsulta que recupera as linhas das tabelas de base. Se você estiver usando alias(apelidos), pode usá-los na lista após a instrução SELECT.
WITH CHECK OPTION | Significa que somente as linhas que seriam recuperadas na subconsulta podem ser inseridas, atualizadas ou removidas. Se você não usar essa cláusula, as linhas não são verificadas.
NOME_CONSTRAINT | É o nome que será atribuído à restrição WITH CHECK OPTION ou WITH READ ONLY.
WITH READ ONLY  | Significa que só podem ser lidas as linhas da tabela base.


* #### _PL/SQL_

##### Criar uma SEQUENCE
```
CREATE SEQUENCE  sequence_name
[INCREMENT BY n]
[START WITH n]
[MAXVALUE n | NOMAXVALUE]
[MINVALUE n | NOMINVALUE]
[CYCLE | NOCYCLE]
[CACHE | NOCACHE]
[ORDER | NOORDER]
```

Cláusula  | Descrição
--------------| ----------------------------------------------
INCREMENT BY  | Especifica o intervalo entre os números sequencias. Pode ser positivo ou negativo e a omissão significa incremento positivo 1 em 1.
START WITH    | É o primeiro número da sequencia.
MAXVALUE      | Especifica o valor máximo que a sequencia pode alcançar.
NOMAXVALUE    | (**default**) Especifica um valor com precisão de 27 digitos positivos ou negativos.
MINVALUE      | Especifica um valor mínimo para a sequencia.
NOMINVALUE    | (**default**) Especifica o valor mínimo de 1 para uma sequence ascendente e precisão negativa de 26 dígitos para sequences descendentes.
CYCLE         | Especifica que após atingido o valor limite, a sequence recomeçará no MINVALUE ou  MAXVALUE
NOCYCLE       | (**default**) Não gera mais números após atingir o limite.
CACHE         | Especifica quantos números a sequence pré-aloca e matém em memória para acesso mais rápido.
NOCACHE       | Valores não são pré-alocados. **Se você omitir CACHE e NOCACHE, o banco de dados armazenará em cache 20 números de sequência por padrão.**
ORDER         | Garante a geração das sequences em ordem de requisição. ORDER é necessário apenas para garantir a geração ordenada se você estiver usando o Oracle Database com Real Application Clusters. Se você estiver usando o modo exclusivo, os números de sequência serão sempre gerados em ordem.
NOORDER       | (**default**) Especifique NOORDER se não quiser garantir que os números de sequência sejam gerados por ordem de solicitação.

##### Alterar uma SEQUENCE
```
alter sequence sequence_name
```

##### Deletar uma SEQUENCE
```
drop sequence sequence_name;
```

##### Criar um auto_increment
```
CREATE SEQUENCE dept_seq START WITH 1 NOCACHE;
```

##### Definir uma TRIGGER para tabela 'departamento'
```
CREATE OR REPLACE TRIGGER dept_bir
BEFORE INSERT ON departamento
FOR EACH ROW

BEGIN
  SELECT dept_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/
```

> #### DQL - Data Query Language
>
> Usando operadores relacionais da linguagem SQL, usados para testar condições

##### IN - _contido em (lista)_
```sql
-- consultar ID 3 e 6
select * from empregados where id IN (3,6);
-- Também é possível negar, ou seja, exibir tudo menos 3 e 6
select * from empregados where id NOT IN (3,6);
```

##### BETWEEN - _entre valores, ou seja, um intervalo de valores_
```sql
-- inclusive (que esteja entre 900 e 2500)
select * from empregados where salario BETWEEN 900 AND 2500;
-- exclusive (que não esteja entre 1000 e 2000)
select * from empregados where salario NOT BETWEEN 1000 AND 2000;
```

##### LIKE - _string semelhante, usando curinga_
```sql
-- % - Representando qualquer sequência de caracteres (inclusive nenhum)
-- Começando com a letra 'A'
select * from empregados where nome LIKE 'A%';
-- _ (underline) - Representando um único caractere
-- Que a segunda letra seja 'a'
select * from empregados where nome LIKE '_a%';
```

##### IS NULL - _testa valores nulos_
```sql
-- É nulo - lista todos com departamento NULOS
select * from empregados where depto_id IS NULL;
-- Não é nulo - exibi se não for nulo
select * from empregados where sobrenome IS NOT NULL;
```

#### _Curiosidades e dicas_

##### O que o comando DESCRIBE faz, listando os campos de uma tabela (altere o NOME_DA_TABELA para consultar uma tabela)
```sql
SELECT
    COLUNAS.COLUMN_NAME AS COLUNA,
    COLUNAS.DATA_TYPE AS TIPO,
    DECODE(COLUNAS.DATA_PRECISION, NULL, COLUNAS.CHAR_COL_DECL_LENGTH, COLUNAS.DATA_PRECISION)  AS TAMANHO,
    COLUNAS.NULLABLE AS EH_NULO

FROM
    USER_TABLES TABELA,
    USER_TAB_COLUMNS COLUNAS
WHERE
    -- JOINS
    TABELA.TABLE_NAME = COLUNAS.TABLE_NAME
    AND TABELA.TABLE_NAME = 'NOME_DA_TABELA'
```

##### Tornar o SQL*Plus no Linux mais produtivo
_Após instalar e executar junto com sqlplus será possivel usar a SETA PRA CIMA - para exibir o último comando (como o historico do bash). Dica do site [br.ccm.net](https://br.ccm.net/faq/4482-oracle-utilizar-sqlplus-no-linux "Tradução de pintuba (Lucia Nouira)")_
```bash
# instalar o pacote rlwrap
sudo apt install rlwrap
# executar junto com sqlplus
rlwrap sqlplus / as sysdba
```

_Para incrementar mais ainda, criar uma alias_
```bash
alias sqlplus="rlwrap sqlplus"
# recarregar o bashrc
source ~/.bashrc
```

##### Authors

* [**Diorgenes Morais**](https://www.linkedin.com/in/diorgenes-m-silva "Linkedin")
