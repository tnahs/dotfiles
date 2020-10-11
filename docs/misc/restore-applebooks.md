# Restore Apple Books

## Disable Syncing

1. Open Apple Books
2. Under `Books` > `Preferences...` > `General`
    - Un-check `Sync: Sync collections, bookmarks, and highlights across devices`

## (Optional) Disable and clear iCloud Drive

1. Open `System Preferences` > `iCloud`
    1. Un-check `iCloud Drive`
    2. Click `Manage...` at the bottom of the page
    3. Select `Books`
    4. Click `Delete Documents and Data`
2. Restart

Any books that were present should disappear from Apple Books.

## Restore

1. Close Apple Books
2. Navigate to: `~/Library/Containers`
3. If not after a fresh OS install or with an unwanted/broken library:
   1. Delete:
       - `com.apple.BKAgentService`
       - `com.apple.iBooksX*`
   2. Restart (Note: If you open Apple Books before a restart you'll see all your books but they will have broken links. But after a restart Apple Books will look like it's just been opened for the first time.)
   3. Open & Close Apple Books. This creates the `com.apple.BKAgentService` and `com.apple.iBooksX` folders.
4. Delete:
    - `~/Library/Containers/com.apple.BKAgentService`:
    - `~/Library/Containers/com.apple.iBooksX.*` (Note the `.` after `iBooksX`)
    - `~/Library/Containers/com.apple.iBooksX/Data/Documents/AEAnnotation`:
    - `~/Library/Containers/com.apple.iBooksX/Data/Documents/BKLibrary`:
5. Extract latest archive in `~/Workspace/preferences/apple-books/archives`
6. Move to `~/Library/Containers`:
    - `com.apple.BKAgentService`
7. Move to `~/Library/Containers/com.apple.iBooksX/Data/Documents`:
    - `com.apple.iBooksX/Data/Documents/AEAnnotation`
    - `com.apple.iBooksX/Data/Documents/BKLibrary`
8. Restart (Note: If you open Apple books before a restart you'll see all your collections but no books will appear.)
9. All the books and annotations should be restored!
