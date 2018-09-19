/usr/bin/tint2 &
xfdesktop &
synclient HorizScrollDelta=-75 VertScrollDelta=-75 HorizTwoFingerScroll=1 &
synclient PalmDetect=1
compton -b
tilda -h &
syndaemon -i 1 -d -t -K &
VGA=$(cat /sys/class/drm/card0/card0-DP-1/status)
HMDI=$(cat /sys/class/drm/card0/card0-HDMI-A-2/status)
if [ "$VGA"=="connected" ] && [ "$HMDI"=="connected" ]
then
	$HOME/.screenlayout/hemma.sh &
fi
synergys --config $HOME/.synergy.conf &
