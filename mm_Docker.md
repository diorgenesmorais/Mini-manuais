# Docker

>Instalação e execução do Docker

### Versões Suportadas: Yakkety 16.10, Xenial 16.04 (LTS)

* **1 - Suporte a HTTPS no uso do apt**
```bash
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
```

* **2 - Adicionar chave GPG Docker Oficial**
```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

* **3 - Verificar a integridade da chave (key fingerprint = 9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88)**
```bash
sudo apt-key fingerprint 0EBFCD88
```

* **4 - Adicionar repositório Docker 'stable'**
```bash
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
```

* **5 - Atualizar lista de repositórios:**
```bash
sudo apt-get update
```

* **6 - Instalar Docker-CE:**
```bash
sudo apt-get install docker-ce
```

* **7 - Verificar instalação:**
```bash
sudo docker run hello-world
```

>Se exibir informações sobre a plataforma Docker, tudo foi instalado corretamente!!

* [**Fonte:**](https://docs.docker.com/engine/installation/linux/ubuntu/)

### Instalar no Linux Mint

* **First import the GPG key**
```bash
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 \
      --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
```

* **Next, point the package manager to the official Docker repository**
```bash
sudo apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'
```

* **Update the package database**
```bash
sudo apt update
```

>Installing both packages will eliminate an unmet dependencies error when you try to install the 

* **linux-image-extra-virtual by itself**
```bash
sudo apt install linux-image-generic linux-image-extra-virtual
```

* **Reboot the system so it would be running on the newly installed kernel image**
```bash
sudo reboot
```

* **Install Docker**
```bash
sudo apt install docker-engine
```

* **Run a Docker container**

>This container is just a test container, and it will run and exit
```bash
sudo docker run hello-world
```

* [**Referência:**](http://linuxbsdos.com/2016/12/13/how-to-install-docker-and-run-docker-containers-on-linux-mint-1818-1/)

##### How to search for Docker images
```bash
sudo docker search "linux mint"
```

##### Run a Docker container using the official Ubuntu image
```bash
sudo docker run -it ubuntu bash
```

##### Run a Docker container using the official Nginx image
```bash
sudo docker run -p 80:80 nginx
```

##### Alternatively, you can force the container to detach by running this command
```bash
sudo docker run -d -p 80:80 nginx
```

##### List all containers, running or not
```bash
sudo docker ps -a
```

* **The output of the above commands takes this form**
> CONTAINER ID      IMAGE        COMMAND              STATUS                PORTS                   NAMES
> 260c12455185        redis   "docker-entrypoint.sh"  Up 14 seconds          6379/tcp                      jolly_ride
> c43c9f709786        nginx   "nginx -g 'daemon off"  Up 2 minutes       0.0.0.0:80->80/tcp, 443/tcp   desperate_ritchie
> 0febde3715a0        ubuntu       "bash"           Exited (0) 5 minutes ago                           infallible_lalande
> 0e5e4b38037a        hello-world    "/hello"          Exited (0) 2 hours ago                             grave_jones
 
##### List only running containers
```bash
sudo docker ps
```

##### Remove a stopped container. Specify the container's id or name when removing it. In this case, we remove the container using its name
```bash
sudo docker rm grave_jones
```

##### To remove a running container, first stop it using its name or id. In this case, we stop it using its id
```bash
sudo docker stop 260c12455185
```

##### Then remove it
```bash
sudo docker rm 260c12455185
```

##### Listing Docker images
```bash
sudo docker images
```

* **Output of above command**
> REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
> redis               latest              1c2ac2024e4b        6 days ago          182.9 MB
> ubuntu              latest              4ca3a192ff2a        13 days ago         128.2 MB
> nginx               latest              abf312888d13        2 weeks ago         181.5 MB
> hello-world         latest              c54a2cc56cbb        5 months ago        1.848 kB

##### Delete a Docker image using its name
```bash
sudo docker rmi hello-world
```

##### And in this case, using it id
```bash
sudo docker rmi 1c2ac2024e4b
```
______________

##### Mapear volume no host hospedeiro
```bash
sudo docker run -d --name web_pasta -v /home/ricardo/site:/usr/local/apache2/htdocs -p 9091:80 httpd
```

##### Configurar variáveis de ambiente (-e)
```bash
sudo docker run -d --name database -e MYSQL_ROOT_PASSWORD=123 -e MYSQL_DATABASE=teste -e MYSQL_USER=fulano -e MYSQL_PASSWORD=senha mysql:5.5
```

##### Linkar um container ao outro
```bash
sudo docker run -d -p 8080:80 --name php --link dadabase:db -v /home/fulano/html:/var/www/html php:5.6-apache
```

##### Criar uma nova rede
```bash
sudo docker network create redeA
```

##### Usar uma rede criada
```bash
sudo docker run -itd --name nome_container --network=redeA nome_imagem
```

##### Renomear a imagem
```bash
sudo docker tag nome_atual:1.0 novo_nome:2.0
```

### Authors

* [**Diroegenes Morais**](https://github.com/diorgenesmorais)

##### Version

* **1.0.3**
