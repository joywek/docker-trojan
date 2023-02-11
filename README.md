# docker-trojan

An unidentifiable mechanism that helps you bypass GFW.

1. Create a new configuration file `config.json` in the `/etc/trojan` directory


```json
{
    "run_type":    "server",
    "local_addr":  "0.0.0.0",
    "local_port":  443,
    "remote_addr": "127.0.0.1",
    "remote_port": 80,
    "password":    ["your_password_1", "your_password_2"],
    "ssl": {
        "cert":    "/etc/trojan/pki/trojan-us.pem",
        "key":     "/etc/trojan/pki/trojan-us.key"
    }
}
```

2. Starting a new **Trojan** instance:

```sh
docker run --name trojan \
           --network host \
           -v /etc/trojan:/etc/trojan \
           -d
           joywek/trojan
```

