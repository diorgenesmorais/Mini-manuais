# Network

>Comandos de investigação de rede
>
>Equivalência:
>
>1 mega = 1024Kbps
>
>Converter Kbps em Kbyte
>
>Kbps / 8 = Kbyte

**Testar conexão TCP e UDP** (seria como **"ping"** para uma determinada porta) verificar se há conectividade em uma porta
```bash
nc -vz localhost 8443
```

**Ver se a porta está aberta com Nmap**
```bash
nmap -p 8443 localhost
```

**Mostra o rastreio:**
```bash
sudo nmap -A -T4 host
```

**Listando as portas abertas usando NMap:**
```bash
sudo nmap -v ip_address
```

**Consultar rota de um site:**
```bash
sudo traceroute -I <url ou ip_address>
```

**Conferir o MAC de ip na rede:**
```bash
arping -f -c <count> -w <timeout> -I <interface=[eth0]> <ip>
```

>Sample:

```bash
arping -f -c 1 -w 1 -I wlan0 192.168.10.107
```

**Listar os computadores na rede Windows:**
```bash
smbtree
```

**Listar os IPs na rede (mask: 255.255.255.0 = 24):**
```bash
sudo nmap -sP 192.168.0.0/24
```

>**Capturar pacotes de tráfigo um determinado host:**
>
>`tcpdump -i <interface> -v <host or net> destino -w <filename>`
>
>```bash
>sudo tcpdump -i wlan0 -v host 192.168.0.105 -w junior.pcap
>```

**Descobrir o hostname (alvo Windows, sem Kaspersky)**
```bash
nmblookup -A ip_address
```

>**Saber qual o MTU da rede:**
>
>**no Linux:**
>
>```bash
>ifconfig
>```
>
>**no Windows:**
>
>```bash
>netsh interface ipv4 show subinterfaces
>```
>
>Testar o limite do **MTU** de 1492, usando o byte de dados de 1464 que somado ao cabeçalho e outros... da 28: 1464 + 28 = 1492:
>
>**no Linux:**
>
>```bash
>ping -c 4 -s 1464 -M do www.google.com.br
>
>
>ping -c 4 -s 1464 -M do 173.194.118.88
>```
>
>**alterar o MTU no Linux**
>
>`sudo ifconfig <interface> mtu <valor>`
>
>**no Windows:**
>
>```bash
>ping -l 1464 -f www.google.com.br
>```



**Pingar para IPv6**
```bash
ping6 -c 4 -I wlan0 fe80::8219:34ff:fe8a:7aff
```

**Configurar IP e Máscara:**

`sudo ifconfig interface ip netmask máscara`
```bash
sudo ifconfig wlan0 192.168.0.150 netmask 255.255.255.0
```

**Ver a tabela de roteamento (windows: route print):**
```bash
route -n
```

**Adicionar o Gateway a tabela de roteamento:**
```bash
sudo route add default gw 192.168.0.1
```

**Meu IP de rede lan**
```bash
hostname -I
```

**Descobrir IP dos seus dispositivos conectados**
```bash
ip addr show

# ou simplesmente:

ip a
```

**Determinando a interface**
```bash
ip addr show wlan0
```

>**Configuração de endereço IPv4 fixo**
>
>configura um ip manualmente
>
>```bash
>sudo ifconfig eth0 192.168.1.1 netmask 255.255.255.0
>```
>
>configura um alias, um segundo endereço ip
>
>```bash
>sudo ifconfig eth0:1 192.168.1.1 netmask 255.255.255.0
>```
>
>configura IP com dot1.q
>
>```bash
>sudo ifconfig eth0.1 192.168.1.1 netmask 255.255.255.0
>```
>
>verifica se a configuração foi realizada com sucesso
>
>```bash
>ifconfig eth0
>```
>
>desativa a placa de rede eth0
>
>```bash
>sudo ifconfig eth0 down
>
># ou
>sudo ifdown eth0
>```
>
>ativa a placa de rede eth0
>
>```bash
>sudo ifconfig eth0 up
>
># ou
>sudoifup eth0
>```
>


#### **Roteamento**

**configura um gateway**
```bash
sudo route add default gw 192.168.10.10
```
**lista a tabela de roteamento**
```bash
route -n
```

> Podemos utilizar o comando 'route' para adicionar rotas estáticas. Por exemplo, imaginemos que a rede da filial seja 192.168.2.0 com máscara 255.255.255.0 e o roteador que da acesso a essa rede seja o ip 192.168.0.200:


```bash
sudo route add -net 192.168.2.0 mask 255.255.255.0 gw 192.168.0.200
```

**Para remover uma rota:**
```bash
sudo route del -net 192.168.2.0 mask 255.255.255.0 gw 192.168.0.200
```

**Remove a rota default**
```bash
sudo route del default
```

**Configurar uma entrada na tabela arp de forma estática**
```bash
sudo arp -s 192.168.2.100 00:00:20:13:c1:b5
```

**Verificar o status fisíco da interface de rede** (mostra se há conectividade na NIC)
```bash
sudo mii-tool  -v
```

**Configuração de endereço IPv4 dinâmico** (dhcp)
```bash
sudo dhclient eth0 -v (configura um ip dinâmicamente por dhcp)
```

**renovar o IP**
```bash
sudo dhclient -r <interface>
```

**Configuração de uma interface para o modo promíscuo**
```bash
sudo ifconfig eth0 promisc
```
**desativa o modo promíscuo**
```bash
sudo ifconfig eth0 -promisc
```

**verifica e interface eth0 está em modo promíscuo**
```bash
sudo ifconfig eth0 | grep -i PROMISC
```

**Analise de tráfego UDP**
```bash
sudo tcpdump -nS -v udp
```

**Descobrir serviço rodando no sistema e respectivos PIDs**
```bash
sudo netstat -ltunp
```

#### Authors

* **Diorgenes Morais**
