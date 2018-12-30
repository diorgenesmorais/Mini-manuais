# Nmap

Dicas e exemplos de uso

###### Ping usando TCP ACK
```bash
sudo nmap -PA 192.168.0.0/24
```

###### Rastrear a porta 445 na rede
```bash
sudo nmap -sC -p 445 -d 10.0.0.1/24
```

###### ou no próprio PC
```bash
sudo nmap -sC -p 445 -d localhost
```

###### Listar os scripts do Nmap
```bash
ls /usr/share/nmap/scripts/
```

###### Exemplo de uso com script
```bash
sudo nmap --script=http-enum localhost
```

###### Exemplo padrão
```bash
sudo nmap -A -T4 localhost
```

###### Varredura de ping (ping sweep)
```bash
sudo nmap -sP 192.168.0.0/24
```

###### TCP connect scan (three way handshake: syn, syn-ack, ack) - testa a conexão
```bash
sudo nmap -sT 192.168.0.102
```

###### Uma forma melhor e discreta (SYN scan) - verifica a porta aberta
```bash
sudo nmap -sS 192.168.0.102
```

