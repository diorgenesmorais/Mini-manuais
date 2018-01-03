# TypeScript

> Organizando o ambiente de desenvolvimento com TypeScript

### Obter e instalar o Nodejs
```
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
```
```
sudo apt-get install -y nodejs
```

### Ver a versão do Nodejs
```
node -v
```

### Ver a versão do npm
```
npm -v
```

### Visual Studio baixar o pacote .deb do site:

[Visual Studio](https://code.visualstudio.com/)

### Instalar o TypeScript
```
sudo npm install -g typescript
```

### Ver a versão do TypeScript
```
tsc -v
```

### Inicie um projeto:
```
tsc --init
```

### Abrir o "tsconfig.json" com o Visual Studio Code
```
code .
```

### O comando acima irá gera um arquivo com o nome “tsconfig.json”, altere este arquivo deixando como abaixo:
```
{
    "compilerOptions": {
        "target": "es5",
        "watch": true
    }
}
```

### Depois disso, quando você executar o arquivo, o próprio comando do TypeScript vai ficar olhando por alterações nos arquivos “*.ts” para poder transpilá-lo novamente.

### Tecle: Ctrl+Shift+B e selecione tsc: build tsconfig.json e tecle ENTER (Tasks > Run Build Task... > tsc: build tsconfig.json”)

# Authors

* **Diorgenes Morais** - [diorgenesmorais](https://github.com/diorgenesmorais)

# Version

* 1.0.1
