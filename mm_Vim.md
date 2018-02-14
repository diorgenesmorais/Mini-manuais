# Mini manual do VIM
 
###### Sair sem salvar
```
:q!
```

###### Salva e sai - também pode ser usado ZZ (shift zz)
```
:wq
```

###### Buscar por uma palavra - Ex: /qualquercoisa - irá procurar por qualquercoisa
```
/
```

###### Substituir uma letra, tecle r e depois digite a letra que irá substituir
```
r
```

###### Ativar a numeração de linhas em um arquivo
```
:set number
```

###### Desativar a numeração
```
:set nonumber
```

###### Alterar a permissão do arquivo atual [!] executar chmod, [%] refere-se ao próprio arquivo
```
:!chmod 744 %
```

###### Saber o total de linhas
```
Ctrl + g
```

###### Mover o cursor meia tela para cima
```
Ctrl + u
```

###### Mover o cursor meia tela para baixo
```
Ctrl + d
```

###### Insere texto após a posição atual do cursor (insere apartir de onde está)
```
a
```

###### Insere texto no final da linha atual
```
A
```

###### Cria uma nova linha abaixo e entra no mode de inserção
```
o
```

###### Cria uma nova linha acima e entra n modo de inserção
```
O
```

###### Junta a linha atual e a linha logo abaixo acrescentando um espaço entre ela
```
J
```

###### Ir para o final do arquivo
```
G
```

###### Ir para o início da linha
```
I
```

###### (til + barra de espaço) torna o caractere minúsculo em MAIÚSCULO e vice-versa (digite o número de caracteres + ~ + barra de espaço)
```
~ [SPACE]
```

###### Apaga o caractere atual (digite um número de caracteres e tecle x para apagar uma palavra)
```
x
```

###### Apaga o caractere à esquerda (5X - apaga 5 caracteres à esquerda)
```
X
```

###### Apaga o caractere atual e entra no modo de inserção
```
s
```

###### Apaga o conteúdo da linha atual e entra no modo de inserção
```
S
```

###### Desfazer o último comando
```
u
```

###### Refazer o último comando desfeito
```
Ctrl + r
```

###### Copia a linha atual
```
yy
```

###### Colar a cópia após
```
p
```

###### Cola a cópia antes da linha atual
```
P
```

###### Substitua o n pelo número de linhas a copiar abaixo
```
yn
```

###### Copia a palavra
```
yw
```

###### Recorta a linha atual
```
dd
```

###### Recorta a palavra atual
```
dw
```

###### Recorta 3 linhas apartir da atual
```
3dd
```

###### Recorta da posição atual até o final da linha
```
D
```

###### Recorta a linha atual e entra no modo de inserção
```
cc
```

###### Ver tabela de caracteres especiais (digite q para sair)
```
:digraphs
```

###### No modo de inserção digite o código (lado esquerdo) da tabela para inserir um caractere especial
```
Ctrl + k
```

###### Abre uma tabela de conteúdo: lista de manuais
```
:help usr_toc.txt
```

###### Como no terminal, rever o histórico de comandos
```
:[seta pra cima]
```

###### Substituir um palavra
```
:%s/esta_palavra/por_esta
```

### configuration

-----------------

###### Mudar o esquema de cores para melhorar a visualizaçãodo texto em janelas de terminal com fundo escuro (default):

> Alterar o arquivo /etc/vim/vimrc de configuração retirando a aspas dupla da linha: "set background=dark


* [**dicas**](http://www.uniriotec.br/~morganna/guia/vim.html)

##### Authors

* **Diorgenes Morais**
