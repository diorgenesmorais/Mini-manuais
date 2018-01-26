# Git flow

> ##### Instalando o git flow no Ubuntu
>
>```bash
>sudo apt install git-flow
>```
>
> [Intallation Instructions](https://github.com/nvie/gitflow/wiki/Linux)
>
> Como o git flow funciona?
>
> Basicamente: fluxo (flow) de trabalho: **start ... finish** (*start para criar, trabalha... finish para finalizar*)

##### Iniciar o git flow
```bash
git flow init
```

#### *FEATURE*

> Defini uma nova funcionalidade
>
> Will be created form the develop (**develop --> feature**)
>
> merge in: develop

##### Iniciar uma feature
```bash
git flow feature start feature_name
```

##### Finalizar uma feature (faz um merge automaticamente com develop e exclui a feature)
```bash
git flow feature finish feature_name
```

##### Publicar uma feature (subir para o repositório remoto)
```bash
git flow feature publish feature_name
```

##### Pegar uma feature do repositório remoto
```bash
git flow feature track feature_name
```

##### Listar as features (list is optional)
```bash
git flow feature list
```

#### *RELEASE*

> Definir uma versão de produção.
>
> Will be created form the develop (**develop --> release**)
>
> merge in: master and develop

##### Criar uma release (version)
```bash
git flow release start 1.0.1
```

##### Finalizar uma release
```bash
git flow release finish 1.0.1
```

##### Publicar uma release (no origin)
```bash
git flow release publish 1.0.1
```

##### Baixar uma release
```bash
git flow release track 1.0.2
```

##### Listar as releases
```bash
git flow release
```

#### *HOTFIX*

> Define um novo **branch** para correção de erros. Ligada a uma **release**
>
> Versão deve ser superior a **release** de escopo
>
> Will be created from the master (**master --> hotfix**)
>
> merge in: master and develop

##### Criar um hotfix
```bash
git flow hotfix start 1.0.2
```

##### Fechar o hotfix
```bash
git flow hotfix finish 1.0.2
```

#### *BUGFIX*

> Define um novo **branch** para correção de erros.
>
> Will be created from the develop (**develop --> bugfix**)
>
> merge in: develop

##### Criar um bugfix
```bash
git flow bugfix start bug_name
```

##### Fechar o bugfix
```bash
git flow bugfix finish bug_name
```

> **Referência:**
>
> #### <https://github.com/nvie/gitflow>

#### Authors

* [**Diorgenes Morais**](https://github.com/diorgenesmorais)
