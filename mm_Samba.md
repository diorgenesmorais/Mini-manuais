# Comandos usando o Samba

##### Acessar outra máquina
```bash
smbclient //<address_ip>/<share> -U <user>
smbclient -U <user> -W <workgroup> //<address>/<share>
```

##### Listar computadores na rede
```bash
smbtree
```

##### Faz consultas usando transmissões, em vez de usar o navegador principal local para obter uma lista de navegação.
```bash
smbtree -b ou --broadcast
```

##### Exibe uma lista de domínios conhecidos. Não exibe dados sobre os servidores e compartilhamentos disponíveis.
```bash
smbtree -D ou --domains
```

##### Exibe uma lista de domínios e servidores. Não exibe dados sobre compartilhamentos.
```bash
smbtree -S ou --servers
```

##### Define o nível de detalhes a serem registrados para arquivos de log. O padrão é 0, o que significa poucos detalhes. Aumente o nível para ajudar a depurar problemas de rede.
```bash
smbtree -dlevel ou --debuglevel=level
```

##### Suprime o prompt de senha, que pode também restringir as informações disponíveis.
```bash
smbtree -N ou --no-pass
```

##### Define o nome de usuário usado para acessar o compartilhamento. Também é possível anexar um sinal de percentual (%) e uma senha, como em teela%lucky para usar teela como nome de usuário e lucky como senha. (Observe que lucky é uma senha muito fraca. Teela parece não se preocupar com essas coisas.)
```bash
smbtree -U username ou --user=username
```

##### Alterar workgroup
```bash
# primeiro fazer backup
sudo cp /etc/samba/smb.conf /etc/samba/smb.conf_backup

# editar a linha do arquivo smb.conf
sudo vi /etc/samba/smb.conf

# verificar um arquivo de configuração smb.conf para correção interna
testparm

# reiniciar o serviço
sudo /etc/init.d/samba restart
```
