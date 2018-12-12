#!/bin/sh

# ----------------------------------------------------------------------------------------------- #
# For macOS Mojave version 10.14.1 (18B75)
# ----------------------------------------------------------------------------------------------- #

# ----------------------------------------------------------------------------------------------- #
#	rsync
#		-v, --verbose              Increase verbosity
#		-q, --quiet                Quiet mode
#		-a, --archive              Archive mode
#		-E, --extended-attributes  Copy extended attributes (xattr)
#   	--delete-after             Receiver deletes after transfer, not before
# ----------------------------------------------------------------------------------------------- #
#   zip
#		-r, --recurse-paths        Travel the directory structure recursively
#		-q, --quiet                Quiet mode
#   	-y, --symlinks             Store symbolic links instead of referenced file.
# ----------------------------------------------------------------------------------------------- #
#	cp
#		-R   					   Copy the folder and subtree (recursive).
#		-f					       Overwrite file regardless of permissions.
# ----------------------------------------------------------------------------------------------- #

# ----------------------------------------------------------------------------------------------- #
#	Moom: ~/Library/Preferences/com.manytricks.Moom.plist
#	Photoshop: ~/Library/Preferences/Adobe Photoshop CC 2018 Settings
#	Safari Bookmarks: ~/Library/Safari/Bookmarks.plist
#	Anki: ~/Library/Application Support/Anki2/
#	Apple Books Database: ~/Library/Containers/com.apple.iBooksX/
#	Apple Books EPUBs: ~/Library/Containers/com.apple.BKAgentService/
# ----------------------------------------------------------------------------------------------- #

# ----------------------------------------------------------------------------------------------- #
#   NOTE: No trailing slash moves folder and contents.
# ----------------------------------------------------------------------------------------------- #


DATE=`date +%Y-%m-%d`
LOCALWORK=$HOME"/Workspace" # local Workspace location


function backup_preferences {

	echo "Backing up preferences..."

	# dotfiles

		# Bash
		cp -f $HOME"/.bashrc" $LOCALWORK"/preferences/dotfiles/"
		cp -f $HOME"/.bash_profile" $LOCALWORK"/preferences/dotfiles/"

		# Moom Shortcuts
		cp -f $HOME"/Library/Preferences/com.manytricks.Moom.plist" \
			$LOCALWORK"/preferences/dotfiles/moom"

		# Brewfile
		brew bundle dump --force --file=$LOCALWORK"/preferences/dotfiles/Brewfile"

	# misc

		# Photoshop preferences
		cp -R -f $HOME"/Library/Preferences/Adobe Photoshop CC 2019 Settings" \
			$LOCALWORK"/preferences/photoshop"

		# Safri Bookmarks
		cp -f $HOME"/Library/Safari/Bookmarks.plist" \
			$LOCALWORK"/preferences/private"
}


function backup_anki {

	ANKI_DECK=$HOME"/Library/Application Support/Anki2" # working Anki deck location
	ANKI_ARCHIVES=$LOCALWORK"/projects/anki/archives" # backup Anki deck & archive location
	NEW_ANKI_ARCHIVE="ankideck-"$DATE.zip

	# Run only if Anki is not running.
	if [[ ! $(pgrep -x "Anki") ]]; then

		# Run only if Anki archive directory exists.
		if [ -d $ANKI_ARCHIVES ]; then

			echo "Archiving Anki..."

			# need quotes around "$ANKI_DECK" to escape spaces
			zip -ryq $ANKI_ARCHIVES/$NEW_ANKI_ARCHIVE "$ANKI_DECK"
			# list by modification time > output anything over 5 > delete them
			cd $ANKI_ARCHIVES; ls -tp | tail -n +7 | xargs rm -rf

			echo "Backing up Anki..."

			# copy un-archived current Anki deck to Workspace
			rsync -aqE --delete-after "$ANKI_DECK" $ANKI_ARCHIVES"/current"

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


function backup_reading {

	APPLEBOOKS_ARCHIVES=$LOCALWORK"/reading/apple-books/archives"
	NEW_APPLEBOOKS_ARCHIVE="apple-books-"$DATE.zip

	# Run only if Apple Books is not running.
	if [[ ! $(pgrep -x "Books") ]]; then

		if [ -d $APPLEBOOKS_ARCHIVES ]; then

			echo "Archiving Apple Books..."

			zip -ryq $APPLEBOOKS_ARCHIVES/$NEW_APPLEBOOKS_ARCHIVE \
				$HOME"/Library/Containers/com.apple.BKAgentService/" \
				$HOME"/Library/Containers/com.apple.iBooksX/"
			# list by modification time > output anything over 5 > delete them
			cd $APPLEBOOKS_ARCHIVES; ls -tp  | tail -n +6 | xargs rm -rf

		else

			echo ""
			echo "### ERROR:"
			echo "### Apple Books backup directory doesn't exist!"
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


if [ "$1" = "-all" ]; then
	backup_preferences
	backup_reading
	backup_anki
elif [ "$1" = "-preferences" ]; then
	backup_preferences
elif [ "$1" = "-reading" ]; then
	backup_reading
elif [ "$1" = "-anki" ]; then
	backup_anki
else
	echo "ERROR: Please supply the proper argument!"
	exit
fi