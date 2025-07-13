# ~/.zshenv
#
# Source for both interactive or non-interactive shells.
# Use it configuration necessary for all zsh sessions.
#
# .zshenv -> .zprofile -> .zshrc -> .zlogin

# dotfiles directory
export DOTFILES="$HOME/.dotfiles"

# project directories
export PROJECTS="$HOME/Projects"
export PROJECTS_ALWAYS="$PROJECTS/000-always"
export PROJECTS_ACTIVE="$PROJECTS/100-active"
export PROJECTS_COLLAB="$PROJECTS/110-collab"
export PROJECTS_MAINTN="$PROJECTS/200-maintain"
export PROJECTS_NEXTUP="$PROJECTS/300-next-up"
export PROJECTS_FUTURE="$PROJECTS/400-future"
export PROJECTS_ONHOLD="$PROJECTS/500-on-hold"
export PROJECTS_INACTV="$PROJECTS/600-inactive"
export PROJECTS_ARCHIV="$PROJECTS/999-archive"

# ochre
export OCHRE_COMPONENT_LIBRARY="$PROJECTS_ALWAYS/ochre-component-library/library"

# bin
export PATH="$PATH:$HOME/.local/bin"

# rust/cargo
export PATH="$HOME/.cargo/bin:$PATH"

# darktable
export PATH="$PATH:/Applications/darktable.app/Contents/MacOS/"
