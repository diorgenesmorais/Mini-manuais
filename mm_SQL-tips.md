# Dicas de SQL

## CONCAT

> Como o próprio nome sugere, a função **CONCAT** concatena duas ou mais strings, resultando em uma String contendo todos os valores informados.

```sql
SELECT
    id,
    CONCAT(first_name, " ", last_name) AS 'fullname'
FROM
    patients
```

Result:

| id | fullname |
|:---:|-------------|       
| 1 | Diorgenes Morais | 
| 2 | Dayane Kelly |     


## TIMESTAMPDIFF

> **TIMESTAMPDIFF** calcula a diferença entre duas datas. Essa diferença pode ser representada em dias, semanas, meses, anos, etc.

```sql
SELECT
    id,
    TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) AS 'age'
FROM
    patients
```


Result:

| id | age |
|:---:|---:|
| 1 | 5 |
| 2 | 83 |

## WHERE... IN...

> Muitas vezes precisamos comparar o valor de uma coluna com uma série de outros valores. Em situações como essa o comando **WHERE IN** pode nos ajudar.

Ao invés de fazer...

```sql
SELECT * FROM documents
WHERE id = 1 OR id = 3 OR id = 7 OR id = 10 OR id = 13
```

Prefira fazer...

```sql
SELECT * FROM documents
WHERE id IN (1, 3, 7, 10, 13)
```

## IFNULL

> Com certeza você já passou pela situação de ter uma coluna que pode ou não ter um valor. O **IFNULL** é útil para definirmos um valor padrão caso essa coluna tenha valor NULL

```sql
SELECT
    id,
    name,
    IFNULL(cpf, '-- NÂO INFORMADO --') AS 'cpf'
FROM users
LIMIT 5
```


Result:

| id  | name | cpf |
|:---:|-------------------|-------------------|
| 1  | Fiona Cordeiro | 104.676.555-68 |
| 2  | Cordelia Heller | 334.222.200-67 |
| 3  | Madaline Schmeler | 135.456.900-48 |
| 3  | Hertha Ryan | -- NÃO INFORMADO -- |
| 4  | Blake Wiegand V | -- NÃO INFORMADO -- |


## DATE_FORMAT

> Sabe aquele DATE ou TIMESTAMP que está no padrão US e você sempre tem dificuldades para converter para o padrão BR?
>
> Pois é, você vai amar a função **DATE_FORMAT**.

```sql
SELECT
    id,
    name,
    DATE_FORMAT(created_at, "%d/%m/%Y %h:%i") AS 'created_at'
FROM users
LIMIT 5
```

Result:

| id  | name        | created_at |
|:---:|-----------------|---------------|
| 1  | Fiona Cordeiro | 01/05/2021 00:00 |
| 2  | Cordelia Heller | 18/10/1974 04:34 |
| 3  | Madaline Schmeler | 06/05/2021 07:15 |
| 3  | Hertha Ryan | 05/04/2021 05:29 |
| 4  | Blake Wiegand V | 05/04/2021 05:28 |


## FIND_IN_SET

> Sabe aquela coluna do tipo SET que tem vários valores e que sempre é horrível buscar um valor nela? Use **FIND_IN_SET** e dê adeus a seus problemas.

```sql
SELECT id, name
FROM students
WHERE FIND_IN_SET("matematica", subjects)
```


Result:

| id  | name |
|:---:|----------------|
| 6 | João Pedro |
| 8 | José Lucas dos Santos |
| 9 | Vanessa Mattos |


## TRIM

> Imagine que você tem uma tabela com um campo username, nesse campo alguns usuários colocam seu username com @ na frente. Ex: *@joaopedro*. Você pode remover esses caracteres com a função **TRIM**.

```sql
SELECT
    id,
    TRIM(LEADING '@' FRO username) AS 'username'
FROM students
```

|       |       |
|-----------|-----------------|
**BOTH**| Remove de ambos os lados da string
**LEADING** | Remove do início da string
**TRAILING**| remove do final da string

Result:


| id | username |
|:---:|-----------------|
| 1 | joaopedro |
| 2 | mariasilva |
| 3 | joselucas |
| 4 | vanessamattos |


## COALESCE

> Imagine que você tem uma tabela onde existem as colunas *telefone*, *celular*, *e-mail* (todas nullables), e você quer retornar o primeiro valor encontrado, nessa mesma ordem de prioridade.
Apresento-lhes o **COALESCE**.

```sql
SELECT
    id,
    COALESCE(phone, mobile, email) AS 'contact'
FROM students
```

Result:

| id | contact |
|: --- :|------------------|
| 6 | (71) 3333-3333 |
| 7 | (11) 98877-4422 |
| 8 | (21) 4001-3000 |
| 9 | vanessamattos@xpto.com |



* Essas foram algumas dicas do Paulo Reis - postada no linkedin

