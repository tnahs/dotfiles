# Synology Network

## Set a Static IP Address

!!! info "DHCP Server"

    Before proceeding, make sure to have setup your router's [DHCP Server](../01-router/#setup-dhcp-server). Otherwise the assigned IP address could possibly be given out by your router to another device.

:octicons-location-24: Where

`Control Panel` • `Network`

:octicons-question-24: How

- In the `Network Interface` tab
    - Select `[Network Interface]` and click `Edit`
        - In the `IPv4` tab
            1. Select `Use manual Configuration`
            2. Set `IP address` to `192.168.0.[XXX]`

## Disable admin/guest Accounts

:octicons-location-24: Where

`Control Panel` • `User`

:octicons-question-24: How

- In the `User` tab
    - Select `[Username]` and click `Edit`
        - In the `Info` tab
            - Check `Disable this account`
                - Select `Immediately`

## Disable QuickConnect

:octicons-location-24: Where

`Control Panel` • `QuickConnect`

:octicons-question-24: How

- In the `General` tab
    - Uncheck `Enable QuickConnect`

## Auto-update DSM

:octicons-location-24: Where

`Control Panel` • `Update & Restore`

:octicons-question-24: How

- In the `DSM Update` tab
    - Click `Update Settings`
        1. Select `Automatically install the new update`
        2. Set `Check schedule` to `Daily` at `00:00`

## DSM Ports / HTTPS

!!! note "WIP"

:octicons-location-24: Where

`Control Panel` • `Network`

:octicons-question-24: How

- In the `DSM Settings` tab
    - Under `General`
        1. Under `DMS ports`
            1. Set `HTTP` to `[XXX0]`
            2. Set `HTTPS` to `[XXX1]`
        2. Check `Automatically redirect HTTP connection to HTTPS for DSM desktop`

## Enable DoS protection

:octicons-location-24: Where

`Control Panel` • `Security`

:octicons-question-24: How

- In the `Protection` tab
    1. Select `[Network Interface]`
    2. Check `Enable DoS protection`

## Enable Auto Block & Account Protection

:octicons-location-24: Where

`Control Panel` • `Security`

:octicons-question-24: How

- In the `Account` tab
    1. Under `Auto Block`
        - Check `Enable auto block`
            1. Set `Login attempts` to `10`
            2. Set `Within (minutes)` to `5`
    2. Under `Account Protection`
        - Check `Enable Account Protection`
            1. Set `Login attempts` to `10`
            2. Set `Within (minutes)` to `1`
            3. Set `Cancel account protection (minutes later)` to `30`

## Keep admin Password on Reset

:octicons-location-24: Where

`Control Panel` • `Update & Restore`

:octicons-question-24: How

- In the `Reset` tab
    - Under `Reset Option`
        - Check `Keep your admin password unchanged`

## Enable SMB

:octicons-location-24: Where

`Control Panel` • `File Services`

:octicons-question-24: How

- In the `SMB/AFP/NFS` tab
    1. Under `SMB`
        - Check `Enable SMB service`
    2. Under `AFP`
        - Uncheck `Enable AFP service`
    3. Under `NFS`
        - Uncheck `Enable NFS`

## Firewall

!!! note "WIP"

!!! warning

    The information below provides a starting point to maintain all basic DSM and SMB functionality. Rules should be updated and customized based on different use cases.

:octicons-location-24: Where

`Control Panel` • `Security`

:octicons-question-24: How

- In the `Firewall` tab
    - Under `General`
        - Check `Enable firewall`
    - Under `Firewall Profile`
        - Select `default` and click `Edit Rules`

|       Enabled       |            Ports            |   Protocol   | Source IP |   Action   |
| :-----------------: | :-------------------------: | :----------: | :-------: | :--------: |
| :octicons-check-24: | Management UI, File Station |     TCP      |    All    |   Allow    |
| :octicons-check-24: |     Windows file server     |     All      |    All    |   Allow    |
| :octicons-check-24: |           Bonjour           |     UDP      |    All    |   Allow    |
| :octicons-check-24: |    `[Additional Ports]`     | `[Protocol]` |  `[IP]`   | `[Action]` |
| :octicons-check-24: |             All             |     All      |    All    |    Deny    |

## SSH

!!! note "TODO"

:octicons-location-24: Where

`Control Panel` • `Terminal & SNMP`

:octicons-question-24: How

- In the `Terminal` tab
    1. Check `Enable SSH service`
    2. Make sure `Port` is set to `22`

!!! warning

    If Synology's firewall is enabled, make sure to add port `22` or `Encrypted terminal service` to the firewall rules.

|       Enabled       |             Ports             |   Protocol   | Source IP |   Action   |
| :-----------------: | :---------------------------: | :----------: | :-------: | :--------: |
| :octicons-check-24: |     `[Additional Ports]`      | `[Protocol]` |  `[IP]`   | `[Action]` |
| :octicons-check-24: | Encrypted terminal service... |     TCP      |    All    |   Allow    |
| :octicons-check-24: |     `[Additional Ports]`      | `[Protocol]` |  `[IP]`   | `[Action]` |

<!-- <https://flatpacklinux.com/2020/01/07/configure-the-ssh-server-on-your-synology-nas/> -->

## SSL Certificate

!!! note "TODO"

## VPN

!!! note "TODO"

<!-- <https://www.wundertech.net/synology-nas-openvpn-server-setup-configuration/> -->
