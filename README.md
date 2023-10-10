# WireUI 🌐

A web user interface to manage your WireGuard setup forked from [wireguard-ui](https://github.com/ngoduykhanh/wireguard-ui)

## Additional Features

- Add an option to auto-apply config changes
- Other small changes and improvements (bug fixes, deploy env, base container on debian)

## Future Improvements
- Recreate Frontend with React

## Features

- Friendly UI
- Authentication
- Lightweight
- Manage extra client information (name, email, etc)
- Retrieve client config using QR code / file / email

![wireguard-ui 0.3.7](https://user-images.githubusercontent.com/37958026/177041280-e3e7ca16-d4cf-4e95-9920-68af15e780dd.png)

## Run WireUI

> ⚠️The default username and password are `admin`. Please change it to secure your setup.

This fork is meant to be used only with docker!
The docker container will run the wireguard-ui server and the wireguard server itself.
All the related staff will be managed by the container.

Run it with:
```bash
docker compose up -d --build
```

## Environment Variables

| Variable                    | Description                                                                                                                                                  | Default                            |
|-----------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------|
| `BASE_PATH`                 | Set this variable if you run wireui under a subpath of your reverse proxy virtual host (e.g. /wireguard))                                              | N/A                                |
| `BIND_ADDRESS`              | The addresses that can access to the web interface and the port                                                                                              | 0.0.0.0:80                        |
| `WGUI_USERNAME`             | The username for the login page. Used for db initialization only                                                                                             | `admin`                            |
| `WGUI_PASSWORD`             | The password for the user on the login page. Will be hashed automatically. Used for db initialization only                                                   | `admin`                            |
| `WGUI_PASSWORD_HASH`        | The password hash for the user on the login page. (alternative to `WGUI_PASSWORD`). Used for db initialization only                                          | N/A                                |
| `WGUI_ENDPOINT_ADDRESS`     | The default endpoint address used in global settings where clients should connect to                                                                         | Resolved to your public ip address |
| `WGUI_FAVICON_FILE_PATH`    | The file path used as website favicon                                                                                                                        | Embedded WireGuard logo            |
| `WGUI_DNS`                  | The default DNS servers (comma-separated-list) used in the global settings                                                                                   | `1.1.1.1`                          |
| `WGUI_MTU`                  | The default MTU used in global settings                                                                                                                      | `1450`                             |
| `WGUI_PERSISTENT_KEEPALIVE` | The default persistent keepalive for WireGuard in global settings                                                                                            | `15`                               |
| `WGUI_FIREWALL_MARK`        | The default WireGuard firewall mark                                                                                                                          | `0xca6c`  (51820)                  |
| `WGUI_TABLE`                | The default WireGuard table value settings                                                                                                                   | `auto`                             |
| `WGUI_INTERFACE`     | The default WireGuard interface name (config will be at /etc/wireguard/<int_name>.conf)                                                                                              | `wg0`          |
| `WGUI_LOG_LEVEL`            | The default log level. Possible values: `DEBUG`, `INFO`, `WARN`, `ERROR`, `OFF`                                                                              | `INFO`                             |
| `EMAIL_FROM_ADDRESS`        | The sender email address                                                                                                                                     | N/A                                |
| `EMAIL_FROM_NAME`           | The sender name                                                                                                                                              | `WireUI`                     |
| `SENDGRID_API_KEY`          | The SendGrid api key                                                                                                                                         | N/A                                |
| `SMTP_HOSTNAME`             | The SMTP IP address or hostname                                                                                                                              | `127.0.0.1`                        |
| `SMTP_PORT`                 | The SMTP port                                                                                                                                                | `25`                               |
| `SMTP_USERNAME`             | The SMTP username                                                                                                                                            | N/A                                |
| `SMTP_PASSWORD`             | The SMTP user password                                                                                                                                       | N/A                                |
| `SMTP_AUTH_TYPE`            | The SMTP authentication type. Possible values: `PLAIN`, `LOGIN`, `NONE`                                                                                      | `NONE`                             |
| `SMTP_ENCRYPTION`           | the encryption method. Possible values: `NONE`, `SSL`, `SSLTLS`, `TLS`, `STARTTLS`                                                                           | `STARTTLS`                         |

### Defaults for server configuration

These environment variables are used to control the default server settings used when initializing the database.

| Variable                          | Description                                                                                   | Default         |
|-----------------------------------|-----------------------------------------------------------------------------------------------|-----------------|
| `WGUI_SERVER_INTERFACE_ADDRESSES` | The default interface addresses (comma-separated-list) for the WireGuard server configuration | `10.252.1.0/24` |
| `WGUI_SERVER_LISTEN_PORT`         | The default server listen port                                                                | `51820`         |
| `WGUI_SERVER_POST_UP_SCRIPT`      | The default server post-up script                                                             | N/A             |
| `WGUI_SERVER_POST_DOWN_SCRIPT`    | The default server post-down script                                                           | N/A             |

### Defaults for new clients

These environment variables are used to set the defaults used in `New Client` dialog.

| Variable                                    | Description                                                                                     | Default     |
|---------------------------------------------|-------------------------------------------------------------------------------------------------|-------------|
| `WGUI_DEFAULT_CLIENT_ALLOWED_IPS`           | Comma-separated-list of CIDRs for the `Allowed IPs` field. (default )                           | `0.0.0.0/0` |
| `WGUI_DEFAULT_CLIENT_EXTRA_ALLOWED_IPS`     | Comma-separated-list of CIDRs for the `Extra Allowed IPs` field. (default empty)                | N/A         |
| `WGUI_DEFAULT_CLIENT_USE_SERVER_DNS`        | Boolean value [`0`, `f`, `F`, `false`, `False`, `FALSE`, `1`, `t`, `T`, `true`, `True`, `TRUE`] | `true`      |
| `WGUI_DEFAULT_CLIENT_ENABLE_AFTER_CREATION` | Boolean value [`0`, `f`, `F`, `false`, `False`, `FALSE`, `1`, `t`, `T`, `true`, `True`, `TRUE`] | `true`      |


## License

MIT. See [LICENSE](https://github.com/domysh/wireui/blob/master/LICENSE).

WireGuard® is a registered trademark of Jason A. Donenfeld.

## Support the original author

If you like the project and want to support it, you can *buy me a coffee* ☕

<a href="https://www.buymeacoffee.com/khanhngo" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" height="41" width="174"></a>
