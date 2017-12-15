# Mini-manual Angular

>Comandos e dicas

### Criar um novo projeto

```
ng new project-name
```

### Instalar o PrimeNG (--save: salvar dependência no package.json)

```
npm install primeng --save
```

### Instalar font-awesome

```
npm install font-awesome --save
```

### Atualizar o fonte-awesome

```
npm update font-awesome
```

### Executar o servidor local

```
ng serve
```

### Executar servidor local em outra porta (pattern: 4200)

```
ng serve --port 8181
```

### Criar um Component sem o spec (usado para unit test) 

```
ng g c --spec=false nome-component
```

### Criar uma diretiva (--spec=false para não criar classes de teste)

```
ng g d noma-da-diretiva --spec=false
```

### Criar um componente sem o arquivo de html e sem css

```
ng g c message --spec=false --inline-template --inline-style
```

### Criar um modulo

```
ng g m mudule-name
```

### Criar um serviço sem criar o ...spec.ts

```
ng g s service-name --spec=false
```

## Authors

* **Diorgenes Morais** - [diorgenesmorais](https://github.com/diorgenesmorais)

## Version

* 1.0.3
