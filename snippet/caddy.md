# caddy

* 安裝目錄 `/usr/local/caddy`
* 設定目錄 `/usr/local/caddy/Caddyfile`
* 證書目錄 `/.caddy/acme/acme-v01.api.letsencrypt.org/sites/xxx.xxx(域名)/`

啟動、停止、重啟

```shell
/etc/init.d/caddy start
/etc/init.d/caddy stop
/etc/init.d/caddy restart
```

查看狀態

```shell
/etc/init.d/caddy status
```

查看Caddy啟動日誌

```shell
tail -f /tmp/caddy.log
```
