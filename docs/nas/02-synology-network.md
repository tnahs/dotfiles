# Synology Network

## Set a Static IP Address

Harum quasi quisquam quia. Qui ea voluptatem repellat dolore eveniet aspernatur eos. Cumque enim consectetur amet et. Ipsam quia quibusdam ea eos debitis pariatur non. Dolores esse asperiores dolores voluptatem.

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

Tempore repellendus ea et distinctio ad illum dolores. Rerum quisquam vero voluptatibus corporis reprehenderit sit eum. Autem doloribus et modi dolorem quia excepturi. Et ut at necessitatibus molestiae voluptate reprehenderit. Quia nesciunt laborum sunt veniam.

:octicons-location-24: Where

`Control Panel` • `User`

:octicons-question-24: How

- In the `User` tab
    - Select `[Username]` and click `Edit`
        - In the `Info` tab
            - Check `Disable this account`
                - Select `Immediately`

## Disable QuickConnect

Accusantium deserunt facilis assumenda optio eligendi rem distinctio. Dolor consectetur dolores ea. Fuga ut voluptatem aut velit possimus deserunt iusto. Eum est et qui. Illum accusantium eum neque explicabo officia fugit et maxime.

:octicons-location-24: Where

`Control Panel` • `QuickConnect`

:octicons-question-24: How

- In the `General` tab
    - Uncheck `Enable QuickConnect`

## Auto-update DSM

Reiciendis aut aut qui voluptate commodi est saepe doloremque. Consectetur officiis consequuntur et nostrum rerum. Minima id aliquid voluptatem saepe facilis harum quas. Rerum aut earum ipsum id laborum rerum cupiditate. Optio aut officia eius voluptatum. Illo nesciunt non voluptate aperiam est alias dolores magni.

:octicons-location-24: Where

`Control Panel` • `Update & Restore`

:octicons-question-24: How

- In the `DSM Update` tab
    - Click `Update Settings`
        1. Select `Automatically install the new update`
        2. Set `Check schedule` to `Daily` at `00:00`

## DSM Ports / HTTPS

Pariatur culpa aliquam recusandae et eveniet magni. Modi ut qui in consequatur ab. Dignissimos at maxime voluptas. Rerum nihil error maxime aut. Omnis veniam accusamus corporis a et. Ut et velit quam quam exercitationem exercitationem omnis.

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

Aut temporibus eius dolore ipsam quas consequatur qui. Quia voluptatum repellendus maxime. Esse omnis et neque delectus velit est.

:octicons-location-24: Where

`Control Panel` • `Security`

:octicons-question-24: How

- In the `Protection` tab
    1. Select `[Network Interface]`
    2. Check `Enable DoS protection`

## Enable Auto Block & Account Protection

Velit itaque non et dicta qui est vitae necessitatibus. Et aliquam et rerum. Vel delectus enim dolorum voluptas dolores eos harum ducimus. Consequatur eum ratione quos quis accusamus temporibus qui. Sit voluptatem facere dolores earum hic. Ratione sequi id cupiditate quae nobis sunt voluptatum.

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

Rerum est et aut vel reiciendis rerum neque deleniti. Aspernatur sunt facilis provident aperiam. Non amet impedit eos qui vel repudiandae.

:octicons-location-24: Where

`Control Panel` • `Update & Restore`

:octicons-question-24: How

- In the `Reset` tab
    - Under `Reset Option`
        - Check `Keep your admin password unchanged`

## Enable SMB

Non ut dolorem libero qui rerum saepe vel. Qui quibusdam voluptas accusamus excepturi ut occaecati quis. Voluptatibus beatae veniam quasi molestiae numquam quia totam necessitatibus.

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

!!! note "TODO"

Sequi voluptatibus asperiores minima non rerum. Sapiente ea id ipsam laboriosam molestiae suscipit sequi est. Nostrum ducimus asperiores ducimus tenetur pariatur. Minus accusantium cum rerum id dolor.

:octicons-location-24: Where

`Control Panel` • `Security`

:octicons-question-24: How

- In the `Firewall` tab

## SSH

!!! note "TODO"

Qui in voluptate accusantium inventore omnis. In aut accusamus error. Totam enim ad repellendus consequatur. Reprehenderit tempore enim qui impedit ex exercitationem. Similique et numquam veritatis.

:octicons-location-24: Where

`Control Panel` • `Terminal & SNMP`

:octicons-question-24: How

- In the `Terminal` tab
    1. Check `Enable SSH service`
    2. Make sure `Port` is set to `22`

## SSL Certificate

!!! note "TODO"

Incidunt omnis voluptatem voluptatem. Quia sunt quasi eos voluptatem deserunt omnis itaque. Dicta nesciunt quos autem eligendi. Repellendus rerum vel est.

:octicons-location-24: Where

:octicons-question-24: How

## VPN

!!! note "TODO"

Eos et architecto dolores pariatur hic dolor adipisci quod. Inventore et quis ullam. Id accusamus non tempora temporibus assumenda eos maiores error. Quo nihil dolores aut vitae quaerat ut eum. Earum sed quod odit ipsum quidem. Doloribus ipsum ipsa repellendus neque autem fugiat velit.

:octicons-location-24: Where

:octicons-question-24: How
