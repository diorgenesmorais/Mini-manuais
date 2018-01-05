# Nodejs - install and config

### Obter o Nodejs
```bash
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
```

### Instalar o Nodejs
```bash
sudo apt-get install nodejs
```

* Em alguns sistemas o **Nodejs** responde como: nodejs e não node, deve-se criar um link simbólico:
```bash
sudo ln -s /usr/bin/nodejs /usr/bin/node
```

* criar um build no sublime-text
  Tools > Build System > New Build System...
  salve o código abaixo com o nome node.sublime-build

```json
{
   "cmd": ["nodejs","$file"],
   "selector": "source.js",
   "working_dir": "${project_path:${folder}}",
   "path": "/usr/bin/"
}
```

## Authors

* [**Diorgenes Morais**](mailto:diorgenesmorais&#064;gmail.com)

### Version

* **1.0.3**
