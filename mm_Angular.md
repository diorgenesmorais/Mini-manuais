# Mini-manual Angular

>Comandos e dicas

* Primeiro passo: segui o manual [dev_TypeScript](https://github.com/diorgenesmorais/Mini-manuais/blob/master/dev_TypeScript.md)

### Instalar o Angular/cli

* Dessintalar uma versão antiga
```bash
sudo npm uninstall -g @angular/cli
```

* Limpar o cache do npm
```bash
npm cache clean
```

* Instalar o @angular/cli
```bash
sudo npm install -g @angular/cli
```

### Criar um novo projeto

```bash
ng new project-name
```

### Instalar o PrimeNG (--save: salvar dependência no package.json)

```bash
npm install primeng --save
```

### Instalar font-awesome

```bash
npm install font-awesome --save
```

### Atualizar o fonte-awesome

```bash
npm update font-awesome
```

### Executar o servidor local

```bash
ng serve
```

### Executar servidor local em outra porta (pattern: 4200)

```bash
ng serve --port 8181
```

### Criar um Component sem o spec (usado para unit test) 

> Nota: o comando --spec=false foi depreciado
>
> Use o comando: --skip-tests ou --skipTests


```bash
ng g c --skip-tests nome-component
```

### Criar uma diretiva (--skip-tests para não criar classes de teste)

```bash
ng g d noma-da-diretiva --skip-tests
```

### Criar um componente sem o arquivo de html e sem css

```bash
ng g c message --skip-tests --inline-template --inline-style
```

### Criar um modulo

```bash
ng g m mudule-name
```

### Criar um serviço

```bash
ng g s service-name
```

### Criar um componente direto na raiz [flat] (sem criar a pasta)

```bash
ng g c nome-da-pasta/nome-do-componente --flat
```

### Authors

* [**Diorgenes Morais**](https://github.com/diorgenesmorais)

### Version

* **1.0.5**
