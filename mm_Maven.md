# Maven

##### Remove todos os downloads que falharam
```bash
find ~/.m2  -name "*.lastUpdated" -exec grep -q "Could not transfer" {} \; -print -exec rm {} \;
```

##### Limpar projeto
```bash
mvn clean
```

#### *Available lifecycle phases are:*

> validate, initialize, generate-sources, process-sources, generate-resources, process-resources, compile, process-classes, generate-test-sources, process-test-sources, generate-test-resources, process-test-resources, test-compile, process-test-classes, test, prepare-package, package, pre-integration-test, integration-test, post-integration-test, verify, install, deploy, pre-clean, clean, post-clean, pre-site, site, post-site, site-deploy.

##### Update-snapshots, Válidar e Empacotar
```bash
mvn -U validate package
```

##### Instalar no repositório local
```bash
mvn install
```

##### Ver a lista de dependências
```bash
mvn dependency:tree
```

##### Ver as dependências resolvidas
```bash
mvn dependency:resolve
```

##### Ver o POM efetivo
```bash
mvn help:effective-pom
```

