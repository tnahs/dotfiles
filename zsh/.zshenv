# ~/.zshenv
#
# Source for both interactive or non-interactive shells.
# Use it configuration necessary for all zsh sessions.
#
# .zshenv -> .zprofile -> .zshrc -> .zlogin

# bin
export PATH="$PATH:$HOME/.local/bin"

# rust/cargo
export PATH="$HOME/.cargo/bin:$PATH"

# darktable
export PATH="$PATH:/Applications/darktable.app/Contents/MacOS/"

# dotfiles directory
export DOTFILES="$HOME/.dotfiles"

# project directories
export PROJECTS="$HOME/Projects"
export PROJECTS_ALWAYS="$PROJECTS/000-always"
export PROJECTS_ACTIVE="$PROJECTS/100-active"
export PROJECTS_COLLAB="$PROJECTS/110-collab"
export PROJECTS_MAINTN="$PROJECTS/200-maintain"
export PROJECTS_COMPLT="$PROJECTS/300-complete"
export PROJECTS_NEXTUP="$PROJECTS/400-next-up"
export PROJECTS_FUTURE="$PROJECTS/500-future"
export PROJECTS_ONHOLD="$PROJECTS/600-on-hold"
export PROJECTS_INACTV="$PROJECTS/700-inactive"
export PROJECTS_ARCHIV="$PROJECTS/999-archive"

# ochre
export OCHRE_COMPONENT_LIBRARY="$PROJECTS_ALWAYS/ochre-component-library/library"

# FreeCADConfig
export FREECAD_CONFIG="$PROJECTS_ALWAYS/FreeCADConfig"
