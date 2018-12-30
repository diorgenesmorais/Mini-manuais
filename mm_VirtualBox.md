# Virtualbox

> #### Instalar o Virtualbox no Ubuntu

##### Adicione o repositório do aplicativo
```bash
sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" >> /etc/apt/sources.list.d/virtualbox.list'
```

##### Instale a chave do repositório
```bash
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
```

```bash
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
```

##### Instale o Virtualbox
```bash
sudo apt install virtualbox
```

##### Desinstalar o Virtualbox
```bash
suso apt remove virtualbox
```
