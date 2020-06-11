# Comandos no terminal

### Cópiar a saída do prompt (é preciso está instalado o xclip)
```bash
cat arquivo.txt | xclip -selection clipboard
```

### Repete o último comando
```bash
!!
```

### Lista os 10 útimos comandos
```bash
history | tail -10
```

### execute um registro do histórico informando o number
```bash
!<number>
```

### Limpar o histórico
```bash
sudo history -c
```

### localizar um arquivo a partir do (/)
```bash
find / -name nome_do_arquivo 2> /dev/null
```

### criar/agendar tarefa a serem executadas via terminal
```bash
crontab -e
```

### baixar um site
```bash
wget --mirror -c www.site.com
```

### Localizar um comando
- Em qual diretório é executado o git

```bash
which git
```

> /usr/bin/git

### Contar quantos processos para www-data ([ ] para não contar com o comando)
```bash
ps auxf | grep [w]ww-data | wc -l
```

### Ver a syscalls executada pelo chromium
```bash
sudo strace -f -e socket,connect -p PID,DO,CHROMIUM,AQUI
```

- dicas sobre: [strace](https://sergioprado.org/analisando-aplicacoes-linux-com-strace-e-ltrace/)

### Ver os cached IPV4 para os root server
```bash
dnstracer -s . -4 dmseletronica.com
```

### Obter os dados de getaddrinfo por script python
```bash
python -c 'import socket;print socket.getaddrinfo("dmseletronica.com","http")'
```

### DNS - lookup utility
```bash
dig dmseletronica.com
```

### Atualizar arquivos para este diretório [.] (atual), option [-ru] r=recursive path u=atualizar arquivos mais recentes ou inexistente

```bash
cp -ru Diretorio/que/estou/copiando/ .
```

