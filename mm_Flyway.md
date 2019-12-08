# Um simples controle de versão para banco de dados

![Logo](images/flyway-logo-tm.png)


## "Controle de versão para seu banco de dados. Evolução robusta do esquema em todos os seus ambientes. Com facilidade, prazer e simples SQL."
#### [flywaydb.org/](https://flywaydb.org/)


> **Um detalhe importante a se observar:**
>
> A princípio, o **flyway** está configurado para um banco de dados vazio, ou seja, nenhuma tabela tenha sido criada.


 **Observação: ao tentar executar o flyway em uma base de dados com tabelas já criadas será lançada uma exceção (Found non-empty schema `database`)**

### Como o flyway em uma base com tabelas criadas sem o controle de versão

> Configure a propriedade flyway.baselineOnMigrate=true como **true** no arquivo flyway.conf

**Observação: O flyway iniciará a migração apartir de V02__**
 

### fazer uma migração:
```bash
./flyway migrate
```

### consultar a tabela de versão das migrações
```
./flyway info
```

### apagar uma migração que falhou:
```
./flyway repair
```

### Apagar todas as migrações, drop em todas as tabelas.
```
./flyway clean
```

### Executar uma migração com o Maven
```
mvn -Dflyway.url=jdbc:mysql://localhost/seu_banco?useSSL=false -Dflyway.user=myUser -Dflyway.password=myPass -Dflyway.schemas=seu_banco flyway:migrate
```

> Observação: o comando do Flyway é definido na linha de comando após os dois pontos.
>
> [Maven plugin](https://flywaydb.org/documentation/maven/ "Documentação usando Maven")
>
> É possível dropar as tabelas do banco de produção e do banco de teste ao mesmo tempo, veja o comando:
>
> mvn -Dflyway.url=jdbc:mysql://localhost/ -Dflyway.user=myUser -Dflyway.password=myPass -Dflyway.schemas=banco_prod,banco_teste flyway:clean
>
> Reparar a tabela (flyway_schema_history) de histórico do schema:
>
> mvn -Dflyway.url=jdbc:mysql://localhost/ -Dflyway.user=myUser -Dflyway.password=myPass -Dflyway.schemas=banco_prod,banco_teste flyway:repair
>

