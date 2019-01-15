#!/usr/bin/env bash

###############################################################################
# For macOS Mojave version 10.14.1 (18B75)                                    #
###############################################################################

###############################################################################
# zip                                                                         #
#  -r, --recurse-paths        Travel the directory structure recursively      #
#  -q, --quiet                Quiet mode                                      #
#  -y, --symlinks             Store symbolic links instead of referenced file #
###############################################################################
# cp                                                                          #
#  -R                         Copy the folder and subtree (recursive).        #
#  -f                         Overwrite file regardless of permissions.       #
###############################################################################

###############################################################################
# Moom: ~/Library/Preferences/com.manytricks.Moom.plist                       #
# Photoshop: ~/Library/Preferences/Adobe Photoshop CC 2018 Settings           #
# Safari Bookmarks: ~/Library/Safari/Bookmarks.plist                          #
# Anki: ~/Library/Application Support/Anki2/                                  #
# Apple Books Database: ~/Library/Containers/com.apple.iBooksX/               #
# Apple Books EPUBs: ~/Library/Containers/com.apple.BKAgentService/           #
###############################################################################

###############################################################################
# NOTE: No trailing slash moves folder and contents.                          #
###############################################################################


DATE=`date +%Y-%m-%d`
DOTFILES=$HOME"/.dotfiles"
WORKSPACE=$HOME"/Workspace"
ARCHIVES=$HOME"/Workspace/archives"


function trim_folder_contents {

	# Run only if rmtrash is installed.
	if [ -x "$(command -v rmtrash)" ]; then

		FOLDER=$1
		LIMIT=$2

		echo "Trimming: $FOLDER to $LIMIT files..."

		cd $FOLDER

		# Adding 1 to the Limit and prepending a "+"
		TAIL_LIMIT="+$(($LIMIT+1))"

		# List by modification time | output items over TAIL_LIMIT | delete them.
		ls -tp  | tail -n $TAIL_LIMIT | xargs rmtrash
	else

		echo ""
		echo "### WARNING:"
		echo "### rmtrash not installed!"
		echo "### Files in $FOLDER will not be trimmed!"
		echo ""
	fi
}


function run_backup_dotfiles {

	echo "Backing up .dotfiles..."

	# Brewfile
	if [ -f $DOTFILES"/Brewfile" ]; then
		mv -f $DOTFILES"/Brewfile" $DOTFILES"/Brewfile.bak"
	fi
	brew bundle dump --file=$DOTFILES"/Brewfile"

	# Moom Shortcuts
	cp -f $HOME"/Library/Preferences/com.manytricks.Moom.plist" \
		$DOTFILES"/moom"
}


function run_backup_preferences {

	echo "Backing up preferences..."

	# Photoshop preferences
	cp -R -f $HOME"/Library/Preferences/Adobe Photoshop CC 2019 Settings" \
		$WORKSPACE"/preferences/photoshop"

	# Safari Bookmarks
	cp -f $HOME"/Library/Safari/Bookmarks.plist" \
		$WORKSPACE"/preferences/private"
}


function run_backup_anki {

	ANKI_DECK=$HOME"/Library/Application Support/Anki2"
	ANKI_ARCHIVES=$ARCHIVES"/anki"
	NEW_ANKI_ARCHIVE="anki21deck-$DATE.zip"

	function archive_anki {

		echo "Archiving Anki 2.1..."

		# Need quotes around "$ANKI_DECK" to escape spaces
		zip \
			--recurse-paths \
			--symlinks \
			--quiet \
			$ANKI_ARCHIVES/$NEW_ANKI_ARCHIVE "$ANKI_DECK"
	}

	# Run only if Anki is not running.
	if [[ ! $(pgrep -x "Anki") ]]; then

		# And only if Anki archive directory exists.
		if [ -d $ANKI_ARCHIVES ]; then

			archive_anki

			trim_folder_contents $ANKI_ARCHIVES 5

		else

			echo ""
			echo "### WARNING:"
			echo "### Anki backup directory doesn't exist!"
			echo "### Skipping Anki!"
			echo ""
		fi

	else

		echo ""
		echo "### WARNING:"
		echo "### Anki is running!"
		echo "### Skipping Anki!"
		echo ""
	fi
}


function run_backup_books {

	BOOKS_ARCHIVES=$ARCHIVES"/apple-books"
	NEW_BOOKS_ARCHIVE="apple-books-$DATE.zip"

	function archive_books {

		echo "Archiving Apple Books..."

		zip \
			--recurse-paths \
			--symlinks \
			--quiet \
			$BOOKS_ARCHIVES/$NEW_BOOKS_ARCHIVE \
			$HOME"/Library/Containers/com.apple.BKAgentService/" \
			$HOME"/Library/Containers/com.apple.iBooksX/"
	}

	# Run only if Apple Books is not running.
	if [[ ! $(pgrep -x "Books") ]]; then

		# And only if Apple Books archive directory exists.
		if [ -d $BOOKS_ARCHIVES ]; then

			archive_books

			trim_folder_contents $BOOKS_ARCHIVES 5

		else

			echo ""
			echo "### ERROR:"
			echo "### Apple Books archive directory doesn't exist!"
			echo "### Skipping Apple Books!"
			echo ""
		fi

	else

		echo ""
		echo "### WARNING:"
		echo "### Apple Books is running!"
		echo "### Skipping Apple Books!"
		echo ""
	fi
}


if [ -d $DOTFILES ] && [ -d $WORKSPACE ] && [ -d $ARCHIVES ]; then

	if [ "$1" = "all" ]; then

		run_backup_preferences
		run_backup_dotfiles
		run_backup_books
		run_backup_anki

	elif [ "$1" = "anki" ]; then

		run_backup_anki

	elif [ "$1" = "books" ]; then

		run_backup_books

	elif [ "$1" = "dotfiles" ]; then

		run_backup_dotfiles

	elif [ "$1" = "preferences" ]; then

		run_backup_preferences

	else

		echo ""
		echo "### ERROR:"
		echo "### PLEASE SUPPLY THE PROPER ARGUMENT!"
		echo "### EXITING!"
		echo ""
		exit
	fi

else

	echo ""
	echo "### ERROR:"
	echo "### $DOTFILES OR $WORKSPACE OR $ARCHIVES DOES NOT EXIST!"
	echo "### EXITING!"
	echo ""
	exit
fi