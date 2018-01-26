# Git

> ### Mini manual de referência

#### Configuração inicial (básica)

>```bash
>git config --global user.name "Seu nome"
>git config --global user.email seu.email.git@gmail.com
>git config --global core.editor vim
>```


##### Transformar diretório atual em repositório Git
```bash
git init
```

##### Listar os arquivos que são controlados pelo Git
```bash
git ls-files
```

##### Ver status dos arquivos no repositório
```bash
git status
```

##### Criar uma nova branch e já continuar trabalhando (atalho: cria e muda p/ nova branch)
```bash
git checkout -b nome_da_branch
```

##### Antes de fazer um merge, devemos atualizar a branch com a remota
```bash
git pull
```

##### Após o git pull, se houver atualização (remota) podemos (devemos) atualizar a branch develop com base na master
```bash
git rebase master develop
```

##### Mudar para outra branch
```bash
git checkout nome_da_branch_que_quer_ir
```

##### Atualizar a branch <master> com a branch <develop>
```bash
git merge develop
```

##### Desfazer uma alteração em um determinado arquivo que não foi adicionado (antes do git add)
```bash
git checkout -- nome_do_arquivo
```

##### Retirar um arquivo da área de seleção (do estado de pronto para ser comitado após o git add)
```bash
git reset HEAD nome_do_arquivo
```

##### Desfazer o último commit voltando para um log anterior (informe o hash anterior ao último commit)
```bash
git reset <hash_previous_to_last_commit>
```

##### Reverter (para o que era antes) um commit antigo (ele desfaz e gerando um novo commit
```bash
git revert <hash_of_commit>
```

##### Deletar branch que não vai mais usar (local)
```bash
git branch -d nome_da_branch
```

##### Deletar branch remota
```bash
git push origin :nome_da_branch
```

##### Criar tag (local)
```bash
git tag -a v1.0.1 -m "anotação"
```

##### Enviar tag para repositório remoto
```bash
git push origin master --tags
```

##### Deletar tag (local)
```bash
git tag -d v1.0.1
```

##### Deletar tag no repositório remoto
```bash
git push origin :v1.0.1
```

##### Exibir as branchs local
```bash
git branch [--list]
```

##### Exibir as branchs remotas
```bash
git branch -r
```

##### Criar uma branch local e ligar a remota
```bash
git branch -t <nome_da_branch> origin/nome_da_branch
```

##### Adicionar um arquivo para ser rastreado pelo Git (talvés seja necessário usar sudo)
```bash
git add full_filename

# or use . to all:
git add .

# or use -A to all (mais completo):
git add -A
```

##### Comitar os arquivos do repositório local
```bash
git commit -m "Mensagem explicativa"

# or add all changes and commit, but new files you have not told Git about are not affected.
git commit -a
```

##### Verificar histórico das alterações comitadas no repositório
```bash
git log
```

##### Apontar o seu projeto para o GitHub (https)
```bash
git remote add origin https://github.com/conta_no_github/nome_do_projeto.git
```

##### Apontar o seu projeto para o GitHub (ssh)
```bash
git remote add origin git@github.com:username/project_name.git
```

##### Enviar as alterações para o GitHub
```bash
git push -u origin master
```

> Se usou **-u** no comando anterior, para enviar as alterações da próxima vez, use:
>```bash
>git push
>```

##### Clonar (cópiar projeto [directory to directory]), em um diretório
(this command will create a directory with the name of the project)
```bash
git clone https://github.com/conta_no_github/nome_do_projeto.git
```

##### Se houver uma cópia do projeto localmente, para atualiza-lo
```bash
git pull origin master
```

##### Remover arquivos que já foram submetidos de serem monitorados localmente após serem colocados na lista do .gitignore
```bash
git rm --cached filename
```

##### Remover diretório de serem monitorados
```bash
git rm -r --cached dir/
```

##### Remover todos (.) os arquivos da lista do git local de forma recursiva
```bash
git rm -r .
```

##### Listar as branch
```bash
git branch
```

##### Alterar de Branch
```bash
git checkout <branch-name>
```

##### Inspecionar um remoto (git remote show [nome-remoto]
```bash
git remote show origin
```

##### Alterar url de um repositório remoto
```bash
git remote set-url origin https://github.com/conta_no_github/nome_do_projeto.git
```

##### Rescrever o histórico do último commit (depois dê um merge e depois "empurre" para o repositório)
```bash
git commit --amend
git pull
git push
```

##### Ver as últimas alterações adicionadas
```bash
git diff --staged
```

##### Comparar (diferença) arquivo do working directory
```bash
git diff origin/master
```

##### Estando na branch master, comparar o que foi alterado no develop
```bash
git diff develop origin/master
```
##### Listar os nomes de arquivos modificados
```bash
git diff --name-only
```

##### Descobrir quem realizou as alterações em um arquivo linha a linha (use "q" para sair)
```bash
git blame filename
```

#### Note

> ##### Um exemplo de fluxo de trabalho
>
> * Crie uma branch **develop**
>
>```bash
>git checkout -b develop
>```
>
> * Crie uma **feature** a partir de develop
>
>```bash
>git checkout -b my-feature develop
>```
>
> * Após finalizar a feature:
>  * mude para develop;
>  * faça um merge;
>  * delete a branch 'my-feature'
>
>```bash
>git checkout develop
>git merge --no-ff my-feature
>git branch -d my-feature
>```
>
> Normalmente usa esse fluxo, porque não usar o [git flow](https://github.com/diorgenesmorais/Mini-manuais/blob/master/mm_git_flow.md)

#### Authors

* [**Diorgenes Morais**](https://github.com/diorgenesmorais)
