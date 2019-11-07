# NVM - como instalar no Ubuntu

> [NVM](https://github.com/nvm-sh/nvm "Consulte a versão mais atual") - Node Version Manager


##### Preparar o ambiente (pacotes de dependências)
```bash
sudo apt install build-essential libssl-dev
```

##### Instalar (escolha uma versão mais atual)
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash
```

```bash
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash
```
##### Lista de comandos - help
```bash
nvm ls-remote
```

##### Instalar uma versão do Node
```bash
nvm install v8.11.2
```

##### Usar uma versão específica do Node
```bash
nvm use v8.11.2
```

##### Referência:
* [CollabCode](https://medium.com/collabcode/como-instalar-node-js-no-linux-corretamente-ubuntu-debian-elementary-os-729fb4c92f2d) 
