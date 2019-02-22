# -----------------------------------------
# EggTimer 2 for Alfred 3
# by Carl Smith (@CarlosNZ)
# -----------------------------------------

#First run check
if [ ! -e "$HOME/Library/Application Support/Alfred 3/Workflow Data/carlosnz.eggtimer2/version" ]; then
	./scripts/first_install.sh
	exit
fi


ver=$(cat "$HOME/Library/Application Support/Alfred 3/Workflow Data/carlosnz.eggtimer2/version")
if [ $ver -lt 205 ]; then
	./scripts/first_install.sh
fi
