# variables go here
[void][bool]$isthereabattery 
[void][int]$batterypercentage
[void]$batterytime
[void]$batterytimeminutes
[void]$batterytimehours
# getting a feel for if a battery even exists
echo "getting battery stats"
sleep 2
    if ((gwmi win32_battery).estimatedchargeremaining -ge 0){
    echo "battery exists so ill assume this is a laptop lol"
    $isthereabattery = $true
    }
else{
"this aint a laptop u idiot :P"
exit
}
do {
$batterypercentage = (gwmi win32_battery).estimatedchargeremaining
$batterytime = ((gwmi win32_battery).estimatedruntime)
$batterytimeminutes = (New-TimeSpan -Minutes $batterytime)
$batterytimehours = (New-TimeSpan -Minutes $batterytime)
echo "you have $batterytimehours hours and $batterytimeminutes minutes remaining"
echo "you have $batterypercentage% remaining"
sleep 2
clear
}until (0)