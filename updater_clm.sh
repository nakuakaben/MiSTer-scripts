#!/bin/bash

# variable
URL="https://github.com"
SCRIPT_SH="clm_script.sh"
SCRIPT_URL="$URL/nakuakaben/MiSTer-scripts/raw/master/$SCRIPT_SH"

# code start here
clear

echo "Downloading..."
	wget -q -t 3 --output-file=/tmp/wget-log --show-progress -O /tmp/$SCRIPT_SH $SCRIPT_URL # downloading to output /tmp
	chmod +x /tmp/$SCRIPT_SH # make executable script
	/tmp/$SCRIPT_SH # run script 
	rm -f /tmp/$SCRIPT_SH # clean file in /tmp at the end 
	
# if you use this script on FPGA - LXDE

echo -e " ---------------------------------"
echo -e " Update file on FPGA... \c"
if [ "$(uname -n)" != "MiSTer" ]; then
		echo "not possible"
			echo -e "\n This option is only available under LXDE on the MiSTer FPGA."
			echo -e " Copy MiSTer (file) on your SD Card /media/fat/ or upload. \n" 
		exit 1
        else 
	echo "done"
	cp -v "$HOME/MiSTer/MiSTer" /media/fat/
fi

exit 0
