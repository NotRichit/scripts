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
         2 "Pufferpanel"
         3 "Code Server"
         4 "Docker"
         5 "Exit")

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
            bash <(curl -s https://pterodactyl-installer.se)
            echo " ########"
            echo "Use serveo tunnel to access the pterodactyl (port 80)"
            ;;
        2)
            curl -s https://packagecloud.io/install/repositories/pufferpanel/pufferpanel/script.deb.sh | sudo bash
            sudo apt-get install pufferpanel -y
            sudo pufferpanel user add
            sudo systemctl enable --now pufferpanel
            echo "Pufferpanel is now running"
            sleep 1
            echo "Use serveo tunnel to access it (port 8080)"

            ;;
        3)
            curl -fsSL https://code-server.dev/install.sh | sh
            echo "Use serveo Tunnel to access"
            ;;
        4) 
            for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
            # Add Docker's official GPG key:
            sudo apt-get update
            sudo apt-get install ca-certificates curl
            sudo install -m 0755 -d /etc/apt/keyringssudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
            sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
     sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
     sudo docker run hello-world
           ;;
         
           5)
             exit
            ;;
         
esac
