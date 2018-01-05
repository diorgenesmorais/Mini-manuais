# TypeScript

> Organizando o ambiente de desenvolvimento com TypeScript

### Obter e instalar o Nodejs
```bash
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
```
```bash
sudo apt-get install -y nodejs
```

### Ver a versão do Nodejs
```bash
node -v
```

### Ver a versão do npm
```bash
npm -v
```

### Visual Studio baixar o pacote .deb do site:

[Visual Studio](https://code.visualstudio.com/)

### Instalar o TypeScript
```bash
sudo npm install -g typescript
```

### Ver a versão do TypeScript
```bash
tsc -v
```

### Inicie um projeto:
```bash
tsc --init
```

### Abrir o "tsconfig.json" com o Visual Studio Code
```bash
code .
```

### O comando acima irá gera um arquivo com o nome “tsconfig.json”, altere este arquivo deixando como abaixo:
```json
{
    "compilerOptions": {
        "target": "es5",
        "watch": true
    }
}
```

### Anotações

* Depois disso, quando você executar o arquivo, o próprio comando do TypeScript vai ficar olhando por alterações nos arquivos “*.ts” para poder transpilá-lo novamente.

* Tecle: Ctrl+Shift+B e selecione tsc: build tsconfig.json e tecle ENTER (Tasks > Run Build Task... > tsc: build tsconfig.json”)

### Funções úteis no TypeScript

* **Encode Base64**
```
btoa(encode to base64)
```
* **Decode Base64**
```
atob(decode of the base64)
```

## Authors

* [**Diorgenes Morais**](https://github.com/diorgenesmorais)

### Version

* 1.0.3
