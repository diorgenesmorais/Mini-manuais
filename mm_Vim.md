# Mini manual do VIM
 
-------------

|Comando | Descrição |
|:----------|:-------------------------------------------------------------------------------------|
| :q!    | Sair sem salvar |
| :wq    | Salvar e sair |
| **Shift** + zz | Salva e sai |
| /      | Busca por palavra. [See case insensitive search](#Case) or [Configure](#configure) |
| r      | Substituir uma letra, tecle r e depois digite a letra que irá substituir |
| yy     | Copia a linha atual |
| y[n]   | Cópiar (Substitua o [[n]](#numero-linhas)[^1] pelo número de linhas a copiar abaixo) |
| yw     | Copia a palavra |
| p      | Colar a cópia após a linha atual |
| P      | Cola a cópia antes da linha atual |
| dd     | Recorta a linha atual [see more](#recortar) |
| dw     | Recorta a palavra atual |
| cc     | Recorta a linha atual e entra no modo de inserção |
| D      | Recorta da posição atual até o final da linha |
| **Ctrl** + g | Saber o total de linhas |
| **Ctrl** + u | Mover o cursor meia tela para cima |
| **Ctrl** + d | Mover o cursor meia tela para baixo |
| :[n]   | Navegação rápida - ir ao número da linha |
| a      | Insere texto após a posição atual do cursor (insere apartir de onde está) |
| A      | Insere texto no final da linha atual |
| o      | Cria uma nova linha abaixo e entra no mode de inserção |
| O      | Cria uma nova linha acima e entra n modo de inserção |
| J      | Junta a linha atual e a linha logo abaixo acrescentando um espaço entre ela |
| G      | Ir para o final do arquivo |
| I      | Ir para o início da linha |
| ~[**SPACE**] | Til + barra de espaço torna o caractere minúsculo em MAIÚSCULO e vice-versa |
| [n]~[**SPACE**] | Digite um número (n) de letras |
| x      | Apaga o caractere atual |
| [n]x   | Digite o número (n) de caracteres que deseja apagar |
| [n]X   | Apaga o caractere à esquerda (n - número de caracteres) |
| s      | Apaga o caractere atual e entra no modo de inserção |
| S      | Apaga o conteúdo da linha atual e entra no modo de inserção |
| u      | Desfazer o último comando |
| **Ctrl** + r | Refazer o último comando desfeito |

[^1]: Colchetes significa que é opcional, algo que pode ser acrescido

--------------

* #### Abrir dois arquivos lado a lado (-O - maiúsculo)
```
vim -O arquivo1 arquivo2
```

* #### Com um arquivo já aberto, abrir um outro arquivo (lado a lado)
```
:vsplit arquivo2
```

* #### Navegar entre os arquivos (pressione as teclas)

> Ctrl + w w

* #### Fechar os dois arquivos ao mesmo tempo
```
:qa
```

* #### Case insensitive search {#Case}
```
/word\c
```

* #### Search with case sensitive (default)
```
/Word\C
```

* #### Substituir um palavra
```
:%s/esta_palavra/por_esta
```

* #### Substituir várias palavras
```
:%s/palavra/por_outra/g
```

* #### Retirar os espaços entre uma linha e outra
```
:g/^$/d
```

* #### Alterar a permissão do arquivo atual [!] executar chmod, [%] refere-se ao próprio arquivo
```
:!chmod 744 %
```

* #### Cópia 5 linhas abaixo contando com a atual {#numero-linhas}
```
y5
```

* #### Recorta 3 linhas apartir da atual {#recortar}
```
3dd
```

* #### Ver tabela de caracteres especiais (digite q para sair)
```
:digraphs
```

* #### No modo de inserção digite o código (lado esquerdo) da tabela para inserir um caractere especial

> Ctrl + k


* #### Abre uma tabela de conteúdo: lista de manuais
```
:help usr_toc.txt
```

* #### Como no terminal, rever o histórico de comandos
```
:[seta pra cima]
```

### configuration

-----------------

* #### Mudar o esquema de cores para melhorar a visualizaçãodo texto em janelas de terminal com fundo escuro (default):

> Alterar o arquivo /etc/vim/vimrc de configuração retirando a aspas dupla da linha: "set background=dark


* #### Ativar a numeração de linhas em um arquivo
```
:set number
```

* #### Desativar a numeração
```
:set nonumber
```

* #### Configurar o case sensitive no vimrc {#configure}
```
# All your searches will be case insensitive
:set ignorecase 

# Your search will be case sensitive if it contains an uppercase letter
:set smartcase 
```

* [**dicas**](http://www.uniriotec.br/~morganna/guia/vim.html)

##### Authors

* **Diorgenes Morais**
