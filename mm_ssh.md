# SSH

> ##### Instalar servidor ssh
>
>```bash
>sudo apt install openssh-server
>```

#### Configurar o acesso root via SSH
> ##### Acessando o arquivo sshd_config
>
>```bash
>sudo nano /etc/ssh/sshd_config
>```
>
> ##### Procurar pela linha: PermitRootLogin without-password (pode ser que esteja assim: PermitRootLogin yes)
>Mudar para:
>```vim
>PermitRootLogin no
>```
>
> ##### Altere também o número da porta para um número diferente de 22
>
>```vim
># What ports, IPs and protocols we listen for
>Port 22
>```
>
>##### Em alguns sistemas não inicia o serviço SSH automaticamente:
>> ###### No Ubuntu - iniciar ao carregar o sistema
>>```bash
>>sudo systemctl enable ssh.socket
>>```
>>
>> ###### Em outros
>>```bash
>>sudo update-rc.d ssh defaults
>>```


##### Iniciar o serviço SSH manualmente
```bash
sudo /etc/init.d/ssh start
```

##### Acesso remoto SSH
```bash
ssh -p22 username@hostname

# ou com ip (default is: -p22)
ssh username@192.168.0.100
```

##### Acesso remoto SFTP
```bash
sftp -o port=22 username@hostname
```

##### Acesso remoto SFTP Recursivamente (enviar/receber diretório [conteúdo])
```bash
sftp -r -o port=22 username@hostname
```

##### Subir um diretório (obs: ponto):
```bash
put pathname/.
```

##### Visualizar um arquivo em modo gráfico
```bash
ssh -p22 -X username@hostname gedit arquivo.txt
```

##### Redirecionamento de porta
```bash
ssh -p<port> -L <local_port>:localhost:<remote_port> <user>@<host>
```

##### Gerar o par de chaves com tamanho de 4096
```bash
ssh-keygen -b 4096 -t rsa
```

> ##### Não é possível conectar
> ###### Quando já tem gravado no seu sistema uma chave antiga para este host, remova com o comando abaixo:
>
>```bash
>ssh-keygen -f "/home/diorgenes/.ssh/known_hosts" -R [10.0.0.99]:22
>```

##### Copiar a chave pública para o servidor (host remoto)
```bash
ssh-copy-id username@host
```

> Será solicitado a senha do host remoto
