# Restore **Apple Books** EPUBs and Database

   1. Disable Syncing
      + Open `Apple Books`
      + `Books` > `Preferences...` > `General`
        + [ ] Sync: Sync collections, bookmarks, and highlights across devices
   2. (Optional) Disable and clear `iCloud Drive`
      + Open `System Preferences` > `iCloud`
        + [ ] `iCloud Drive`
        + Click `Manage...` at the bottom of the page
        + Select `Books`
        + Press `Delete Documents and Data`
      + Any books that were present should disappear from `Apple Books`.
      + Restart
   3. Restore
        + Close `Apple Books`
        + Navigate to: `~/Library/Containers`
        + If not after a fresh OS install or with an unwanted/broken library:
          + Delete:
            + `com.apple.BKAgentService`
            + `com.apple.iBooksX*`
          + Restart (Note: If you open `Apple Books` before a restart you'll see all your books but they will have broken links. But after a restart `Apple Books` will look like it's just been opened for the first time.)
          + Open & Close `Apple Books`. This creates the `com.apple.BKAgentService` and `com.apple.iBooksX` folders.
        + Delete:
          + `~/Library/Containers/com.apple.BKAgentService`:
          + `~/Library/Containers/com.apple.iBooksX.*` (Note the `.` after `iBooksX`)
          + `~/Library/Containers/com.apple.iBooksX/Data/Documents/AEAnnotation`:
          + `~/Library/Containers/com.apple.iBooksX/Data/Documents/BKLibrary`:
        + Extract latest archive in `~/Workspace/preferences/apple-books/archives`
        + Move to `~/Library/Containers`:
          + `com.apple.BKAgentService`
        + Move to `~/Library/Containers/com.apple.iBooksX/Data/Documents`:
          + `com.apple.iBooksX/Data/Documents/AEAnnotation`
          + `com.apple.iBooksX/Data/Documents/BKLibrary`
        + Restart (Note: If you open Apple books before a restart you'll see all your collections but no books will appear.)
        + All the books and annotations should be restored
