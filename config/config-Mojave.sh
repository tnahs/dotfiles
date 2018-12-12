# #!/usr/bin/env bash








# # Misc Commands

# Remove duplicates in the “Open With” menu
# ```bash
# /System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user
# ```

# disable window opening and closing animations
# `defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false`

# install Command Line Tools without Xcode
# `xcode-select --install`

# recursively delete .DS_Store Files
# `find . -type f -name '*.DS_Store' -ls -delete`

# how long since last restart
# `uptime`

# show OS build number
# `sw_vers`

# get environment variables
# `printenv`

# disable Spotlight indexing
# `mdutil -i off -d /path/to/volume`

# enable Spotlight indexing
# `mdutil -i on /path/to/volume`

# erase Spotlight index and rebuild
# `mdutil -E /path/to/volume`