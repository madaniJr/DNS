## Construire et Lancer le Conteneur

Une fois ces fichiers prêts, exécute ces commandes :

### Construire l’image Docker :

```sh
docker build -t my-dns .
```

### Démarrer le conteneur :

```sh
docker run -d --name dns-server -p 53:53/udp -p 53:53/tcp my-dns
```

### Tester le serveur DNS

Depuis une autre machine, utilise `nslookup` ou `dig` :

```sh
nslookup www.example.com 192.168.1.2
```

---

## Persistance et Logs

Si tu veux garder les fichiers de configuration après l’arrêt du conteneur, utilise un volume :

```sh
docker run -d --name dns-server -p 53:53/udp -p 53:53/tcp \
    -v $(pwd)/named.conf.options:/etc/bind/named.conf.options \
    -v $(pwd)/named.conf.local:/etc/bind/named.conf.local \
    -v $(pwd)/db.example.com:/etc/bind/db.example.com \
    my-dns
```
