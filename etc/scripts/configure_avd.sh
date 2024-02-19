#! /bin/bash
echo $1

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	echo "Using gnu sed"
	sed 's/hw.dPad=.*/hw.dPad=no/' -i $1
	sed 's/hw.keyboard=.*/hw.keyboard=yes/' -i $1
	sed 's/hw.lcd.width=.*/hw.lcd.width=600/' -i $1
	sed 's/hw.lcd.height=.*/hw.lcd.height=1280/' -i $1
	sed 's/hw.lcd.density=.*/hw.lcd.density=240/' -i $1
elif [[ "$OSTYPE" == "darwin"* ]]; then
	echo "Using mac sed"
	sed -i '' 's/hw.dPad=.*/hw.dPad=no/' $1
	sed -i '' 's/hw.keyboard=.*/hw.keyboard=yes/' $1
	sed -i '' 's/hw.lcd.width=.*/hw.lcd.width=600/' $1
	sed -i '' 's/hw.lcd.height=.*/hw.lcd.height=1280/' $1
	sed -i '' 's/hw.lcd.density=.*/hw.lcd.density=240/' $1
elif [[ "$OSTYPE" == "cygwin" ]]; then
	echo "unsupported"
	# POSIX compatibility layer and Linux environment emulation for Windows
elif [[ "$OSTYPE" == "msys" ]]; then
	echo "unsupported"
	# Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
elif [[ "$OSTYPE" == "win32" ]]; then
	echo "unsupported"
	# I'm not sure this can happen.
elif [[ "$OSTYPE" == "freebsd"* ]]; then
	echo "unsupported"
	# ...
else
	echo "unsupported"
	# Unknown.
fi
