FROM ubuntu:latest

RUN apt-get update && apt-get install -y bind9

COPY named.conf.options /etc/bind/named.conf.options
COPY named.conf.local /etc/bind/named.conf.local
COPY db.example.com /etc/bind/db.example.com

EXPOSE 53/udp
EXPOSE 53/tcp

CMD ["/usr/sbin/named", "-g", "-c", "/etc/bind/named.conf"]
