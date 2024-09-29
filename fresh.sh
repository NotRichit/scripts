RESET='\033[0m'       # Text Reset

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
BLUE='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'
echo -e "$BLUE░██████╗░██╗░░██╗░█████╗░░██████╗████████╗"
echo -e "$BLUE██╔════╝░██║░░██║██╔══██╗██╔════╝╚══██╔══╝"
echo -e "$BLUE██║░░██╗░███████║███████║╚█████╗░░░░██║░░░"
echo -e "$BLUE██║░░╚██╗██╔══██║██╔══██║░╚═══██╗░░░██║░░░"
echo -e "$BLUE╚██████╔╝██║░░██║██║░░██║██████╔╝░░░██║░░░"
echo -e "$BLUE░╚═════╝░╚═╝░░╚═╝╚═╝░░╚═╝╚═════╝░░░░╚═╝░░░$RESET"
sleep 1
echo -e "$Yellow Ghast's Installer Script is running..."
sleep 2
echo -ne '#####                     (33%)\r'
sleep 1
echo -ne '#############             (66%)\r'
sleep 1
echo -ne '#######################   (100%)\r'
echo -ne '\n'
echo -e "$RESET"
echo -r "$Cyan Installing Packages..."
apt update -y
apt upgrade -y
apt install wget git net-tools -y
echo "$Green Installed Packages"
HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
BACKTITLE="Ghast"
TITLE="Installer"
MENU="Choose one of the following options:"

OPTIONS=(1 "Pterodactyl"
         2 "Option 2"
         3 "Option 3")

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
        1)
            echo "You chose Option 1"
            ;;
        2)
            echo "You chose Option 2"
            ;;
        3)
            echo "You chose Option 3"
            ;;
esac
