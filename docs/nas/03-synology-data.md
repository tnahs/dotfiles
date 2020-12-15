# Synology Data

## Setup a Data Scrubbing Schedule

Data scrubbing is only supported for `Shared Folders` with `Enable data checksum for advanced data integrity` enabled.

!!! quote

    To protect a shared folder with CRC32 checksum and copy-on-write strategies, you can enable data checksum for advanced data integrity during the shared folder's creation. CRC32 checksum is applied to checking if the data remain identical to when they were originally written, and the system will automatically use RAID redundancy to fix corrupted data. Copy-on-write helps to improve data consistency upon abnormal system shutdown.

    [Create a Shared Folder | Synology](https://www.synology.com/en-global/knowledgebase/DSM/help/DSM/AdminCenter/file_share_create)

!!! quote

    [The `Enable data checksum for advanced data integrity`] checkbox enables metadata redundancy on BTRFS that will allow you to recover from bit rot. There is no good reason not to enable it. Performance overhead is minimal and not nearly a bottleneck in any meaningful scenario.

    For image data, where single bit flip can ruin the image it’s a must. This feature is in fact one of the benefits of using BTRFS as a filesystem.

    via [r/synology](https://www.reddit.com/r/synology/comments/c600jq/enable_data_checksum_for_advanced_data_integrity/es5b8nw/)

:octicons-location-24: Where

`Storage Manager` • `Storage Pool`

:octicons-question-24: How

- In the `Data Scrubbing` tab
    - Click `Set Schedule`
        1. In the `Time Session` tab
            - Check `Enable Data Scrubbing schedule`
                1. Set `Frequency` to `Repeat every three months`
                2. Set a `Start date`
                3. Under `Time Session`
                    - Select `Run at all times`
        2. In the `Select Target` tab
            - Select Storage Pools

## Snapshots

!!! note "TODO"

## Storage Analyzer

!!! note "TODO"

## Clean Recycle Bin Task

:octicons-location-24: Where

`Control Panel` • `Task Scheduler`

:octicons-question-24: How

- Click `Create` select `Scheduled Task` then `Recycle Bin`

    1. In the `General` tab
        - Under `General Settings`
            - Name the `Task` `Clean Recycle Bin`
    2. In the `Schedule`
        1. Under `Date`
            - Set `Run on the following days` to `Daily`
        2. Under `Time`
            1. `Set First run time` to `00:00`
            2. `Set Frequency` to `Every day`
            3. `Set Last run time` to `00:00`
    3. In the `Task Settings` tab
        1. Under `Empty Recycle Bins`
            - Select `Empty all Recycle Bins`
        2. Under `Retention Policy`
            - Set `Number of days to retain deleted files` to `30`

## Enable a Uninterruptible Power Supply Support

:octicons-location-24: Where

`Control Panel` • `Hardware & Power`

- In the `UPS` tab
    - Check `Enable UPS support`

:octicons-question-24: How

## Hyper Backup

!!! note "TODO"

## Synology Drive

!!! note "TODO"

## Time Machine (macOS)

!!! note "TODO"

## rsync

!!! note "TODO"

<!-- <https://www.wundertech.net/how-to-backup-a-linux-pc-to-a-synology-nas-using-rsync/> -->
<!-- <https://www.wundertech.net/use-ssh-keys-to-automatically-backup-a-linux-pc-to-a-synology-nas/> -->
