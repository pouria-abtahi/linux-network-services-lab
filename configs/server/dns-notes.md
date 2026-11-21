# BIND DNS setup (summary)

- `/etc/named.conf`: added `192.168.62.1` to `listen-on port 53` and `192.168.62.0/24` to `allow-query`.
- Forward zone `nspdom52.local` in `/var/named/nspdom52.local.db`: SOA, NS, A records for Projserver and Projclient, MX record for the mail server.
- Reverse zone `62.168.192.in-addr.arpa` in `/var/named/192.168.62.db`: PTR records.
- Validated with:

```bash
named-checkconf /etc/named.conf
named-checkzone nspdom52.local /var/named/nspdom52.local.db
named-checkzone 62.168.192.in-addr.arpa /var/named/192.168.62.db
systemctl restart named.service
```

- `/etc/systemd/resolved.conf`: `DNS=127.0.0.1` on the server, `DNS=192.168.62.1` on the client, `Domains=nspdom52.local`.
