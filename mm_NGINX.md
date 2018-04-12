# NGINX

O NGINX é um poderoso servidor da Web e usa uma arquitetura orientada a eventos, não segmentada, que permite superar o Apache se configurado corretamente. Ele também pode fazer outras coisas importantes, como balanceamento de carga, armazenamento em cache HTTP ou ser usado como um proxy reverso.

##### Definições de configuração
As configurações principais do NGINX estão no arquivo **nginx.conf**, que por padrão se parece com isso.
```
user www-data;
worker_processes 4;
pid /run/nginx.pid;

events {
	worker_connections 768;
	# multi_accept on;
}

http {

	sendfile on;
	tcp_nopush on;
	tcp_nodelay on;
	keepalive_timeout 65;
	types_hash_max_size 2048;
	# server_tokens off;

	# server_names_hash_bucket_size 64;
	# server_name_in_redirect off;

	include /etc/nginx/mime.types;
	default_type application/octet-stream;

	access_log /var/log/nginx/access.log;
	error_log /var/log/nginx/error.log;

	gzip on;
	gzip_disable "msie6";

	# gzip_vary on;
	# gzip_proxied any;
	# gzip_comp_level 6;
	# gzip_buffers 16 8k;
	# gzip_http_version 1.1;
	# gzip_types text/plain text/css application/json application/x-javascript text/xml application/xml application/xml+rss text/javascript;

	include /etc/nginx/conf.d/*.conf;
	include /etc/nginx/sites-enabled/*;
}
```

Várias coisas neste arquivo podem ser ajustadas com base em suas necessidades, mas o NGINX é tão simples de usar que você pode usá-lo até mesmo com as configurações padrão. Algumas das partes mais importantes do arquivo de configuração do NGINX são:

* **worker_processes:**
Essa configuração define o número de processos de trabalho que o NGINX usará. Como o NGINX é de encadeamento único, esse número geralmente deve ser igual ao número de núcleos da CPU.

* **worker_connections:**
Esse é o número máximo de conexões simultâneas para cada processo de trabalho e informa aos nossos processos de trabalho quantas pessoas podem ser atendidas simultaneamente pelo NGINX. Quanto maior, mais usuários simultâneos o NGINX poderá atender.

* **access_log & error_log:**
Estes são os arquivos que o NGINX usará para registrar quaisquer erros e tentativas de acesso. Esses logs geralmente são revisados ​​para depuração e solução de problemas.

* **gzip:**
Estas são as configurações para compactação GZIP de respostas NGINX. Ativar este, juntamente com as várias sub-configurações que, por padrão, são comentadas resultará em uma atualização de desempenho bastante grande. Das sub-configurações do GZIP, deve-se tomar cuidado para o gzip_comp_level, que é o nível de compressão e varia de 1 a 10. Geralmente, esse valor não deve ser acima de 6 - o ganho em termos de redução de tamanho é insignificante, como precisa de muito mais uso da CPU. gzip_types é uma lista de tipos de resposta nos quais a compactação será aplicada.


##### Sources
* [**Article of Stefanos Vardalos in medium.freecodecamp.org**](https://medium.freecodecamp.org/an-introduction-to-nginx-for-developers-62179b6a458f)

##### Authors
* [**Diorgenes Morais**](www.linkedin.com/in/diorgenes-m-silva "Linkedin")
