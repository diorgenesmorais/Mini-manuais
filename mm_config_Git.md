# Git development environment config

##### Criar uma SSH public key (tecle sempre enter para não configurar senha)
```bash
ssh-keygen -t rsa -C "seu_email@provedor.com"
```

##### Cópiar a chave pública para o clipboard (usando o programa xclip)
```bash
cat .ssh/id_rsa.pub | xclip -selection clipboard
```

##### Adicionar a chave (Ctrl+V) no github.com

##### <https://github.com/settings/keys>

> ##### Modificar o arquivo de perfil do prompt de comando (em alguns casos: .bashrc ou .bash_profile ou .zshrc)

##### Adicionar ao final do arquivo o trecho abaixo:

###### configuration on **.bashrc** file
```vim
if [ -f /etc/bash_completion.d/git ]; then
    . /etc/bash_completion.d/git
fi
GIT_PS1_SHOWDIRTYSTATE=true
PS1=$PS1'$(__git_ps1 "(%s)")\$ '
```
