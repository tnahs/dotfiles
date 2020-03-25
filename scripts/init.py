###############################################################################
# git and bash                                                                #
###############################################################################

# Create symlinks to .bashrc, .bash_profile
#   via. ~/.dotfiles/

"""
ln -s $HOME"/.dotfiles/.bashrc" $HOME"/.bashrc"
ln -s $HOME"/.dotfiles/.bash_profile" $HOME"/.bash_profile"
"""

# Create symlinks to bin
#   via. ~/.dotfiles/
"""
ln -s $HOME"/.dotfiles/bin" $HOME"/bin"
"""

# Create symlinks to .gitconfig and .gitignore
#   via. ~/.dotfiles/
"""
ln -s $HOME"/.dotfiles/.gitconfig" $HOME"/.gitconfig"
ln -s $HOME"/.dotfiles/.gitignore" $HOME"/.gitignore"
"""

# Create symlink to Brewfile and restore apps with Homebrew
#   via. ~/.dotfiles/Brewfile
"""
ln -s $HOME"/.dotfiles/Brewfile" $HOME"/Brewfile"
cd && brew bundle
"""


# Install fonts
# TODO: Improve this so we install first .otf then if not available install
# the .ttf. Doing this to preserve all versions of the current font...
#   via. ~/.dotfiles/fonts/

# download latest firacode, if not, install from folder.

# https://github.com/tonsky/FiraCode/releases/latest/

# https://github.com/tonsky/FiraCode/releases/latest/download/package.zip
# https://github.com/tonsky/FiraCode/zipball/master
"""
find $HOME"/.dotfiles/fonts" \
    \( -name "*.ttf" -or -name "*.otf" \) \
    -exec cp -v {} $HOME"/Library/Fonts" \;
"""


# Set Terminal theme


# Restore Moom preferences
#   via ~/.dotfiles/moom/com.manytricks.Moom.plist
# cp -f $HOME"/.dotfiles/moom/com.manytricks.Moom.plist" \
#     $HOME"/Library/Preferences"


# Install Settings Sync Extension
# code --install-extension Shan.code-settings-sync


"""
Want both of these globally. Do we need to set pyenv 3.8.0 before installing?
test
pipx install bpython

pip install psutil
"""
