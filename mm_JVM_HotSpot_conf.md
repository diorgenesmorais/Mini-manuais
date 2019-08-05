# Configurações na JVM HotSpot

##### Controlar o número de invocações a serem aguardadas antes das compilações do JIT
```
XX:CompileThreshold=<NUM>
```

> Padrões
>
> VM client = 1500
>
> VM server = 10000
>

##### Desabilitar o JIT
```
-Xint
```


