$TTL 604800
@       IN      SOA     ns1.example.com. admin.example.com. (
                          2         ; Serial
                          604800    ; Refresh
                          86400     ; Retry
                          2419200   ; Expire
                          604800 )  ; Negative Cache TTL

; Name servers
@       IN      NS      ns1.example.com.

; A records
ns1     IN      A       192.168.1.2
www     IN      A       192.168.1.3
