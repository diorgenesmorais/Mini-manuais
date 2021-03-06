# Regular expressions

###### Using the matches method, confirm that the string has only digits (Returns true if has only digits)
```
true = "05297654467".matches("\\d+");
```

###### Returns false, because although it is only digits the size of the string is greater than 11 digits
```
false = "06149888000105".matches("\\d{11}");
```

###### Removes any characters contained in STRING - based on the ASCII table: [!-/] of "!" up until "/"
```
"06677888105" = "06.g67@.7/8881-05".replaceAll("[!-/]|[:-~]|[Ç-Ý]", "");
```

###### Format the CPF
```
"052.976.544-67" = "05297654467".replaceAll("(\\d{3})(\\d{3})(\\d{3})", "$1.$2.$3-");
```

###### Format the CNPJ
```
"06.149.888/0001-05" = "06149888000105".replaceAll("(\\d{2})(\\d{3})(\\d{3})(\\d{4})", "$1.$2.$3/$4-");
```

###### Get phone of 9 digits + DDD with mask
```
"(81) 98178-8471" = "81981788471".replaceAll("(\\d{0})(\\d{2})(\\d{5})", "$1($2)\u0020$3-");
```

###### Get phone of 8 digits + DDD with mask
```
"(81) 3519-5272" = "8135195272".replaceAll("(\\d{0})(\\d{2})(\\d{4})", "$1($2)\u0020$3-");
```

###### Get phone of 8 or 9 digits + DDD with mask
```
"(81) 3519-5272" = "8135195272".replaceAll("^(\\d{0})(\\d{2})", "$1($2)\u0020").replaceAll("(\\d{4})$", "-$1"));


"(18) 98178-8471" = "81981788471".replaceAll("^(\\d{0})(\\d{2})", "$1($2)\u0020").replaceAll("(\\d{4})$", "-$1"));
```

###### Improving it the code
```
"(81) 98178-8471" = "81981788471".replaceAll("^(\\d{2})", "($1)\u0020").replaceAll("(\\d{4})$", "-$1");
```

###### O curinga .* (and) - é qualquer coisa, inclusive nada

###### Authors

* [**Diorgenes Morais**](https://github.com/diorgenesmorais)
