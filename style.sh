#!/system/bin/sh

#text colors

red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
pink=$(tput setaf 5)
cyan=$(tput setaf 6)
white=$(tput setaf 7)

rbg=$(tput setab 1)
wbg=$(tput setab 7)
bbg=$(tput setab 4)
cbg=$(tput setab 6)
gbg=$(tput setab 2)

bt=$(tput bold 2)
#reset color

reset=$(tput sgr0)


cd
rm -rf .oh-my-zsh > /dev/null 2>&1
clear
echo " ${blue}${bt}[${white}*${blue}] ${green}Installing Dependencies"
echo
pkg install ncurses-utils > /dev/null 2>&1
echo " ${blue}${bt}[${white}+${blue}] ${green}Installing Curl"
echo
pkg install curl -y > /dev/null 2>&1
echo " ${blue}${bt}[${white}+${blue}] ${green}Installing Zsh"
echo
pkg install zsh -y > /dev/null 2>&1


echo " ${blue}${bt}[${white}+${blue}] ${green}Installing Required Packages"
echo
echo " ${blue}${bt}[${white}+${blue}] ${green}This Will Take Some Minutes"
echo
pkg install mpv -y > /dev/null 2>&1
echo "${blue}${bt}${green} ➤ Done"
pkg install tty-clock -y > /dev/null 2>&1
echo "${blue}${bt}${green} ➤ Done"
pkg install dialog -y > /dev/null 2>&1
echo "${blue}${bt}${green} ➤ Done"
echo
echo " ${blue}${bt}[${white}+${blue}] ${green}Installing Figlet"
echo
pkg install figlet -y > /dev/null 2>&1
echo " ${blue}${bt}[${white}+${blue}] ${green}Downloading Figlet Font"
echo
git clone https://github.com/shadowwalker005/figlet-fonts > /dev/null 2>&1
cd figlet-fonts
cp -r * $PREFIX/share/figlet
cd ..
rm -rf figlet-fonts
sleep 2

echo " ${blue}${bt}[${white}+${blue}] ${green}Installing Color-Scheme"
echo
pkg install ncurses-utils -y > /dev/null 2>&1
echo " ${blue}${bt}[${white}+${blue}] ${green}Installing Oh-My-Zsh"
echo
curl -Lo install.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh > /dev/null 2>&1
echo " ${blue}${bt}[${white}*${blue}] ${green}Configuring Oh-My-Zsh"
echo
yes "n" | bash install.sh -y > /dev/null 2>&1
echo " ${blue}${bt}[${white}*${blue}] ${green}Setting Up Shadow Theme"
echo
sed -i "s/robbyrussell/shadowwalker/g" $HOME/.zshrc
cp -r $HOME/style/.dialogrc ~
mkdir -p $HOME/.shadow_sounds
cd && cd style
cp -r wrong.wav welcome.mp3 $HOME/.shadow_sounds
cd && cd style
cp -r iip t cwd cl password login_t $PREFIX/bin
cp -r termux.properties $HOME/.termux > /dev/null 2>&1
sleep 3

clear
#banner for shadow


echo "${red}░██████╗██╗░░██╗░█████╗░██████╗░░█████╗░░██╗░░░░░░░██╗"
echo "${red}██╔════╝██║░░██║██╔══██╗██╔══██╗██╔══██╗░██║░░██╗░░██║"
echo "${red}╚█████╗░███████║███████║██║░░██║██║░░██║░╚██╗████╗██╔╝"
echo "${red}░╚═══██╗██╔══██║██╔══██║██║░░██║██║░░██║░░████╔═████║░"
echo "${red}██████╔╝██║░░██║██║░░██║██████╔╝╚█████╔╝░░╚██╔╝░╚██╔╝░"
echo "${red}╚═════╝░╚═╝░░╚═╝╚═╝░░╚═╝╚═════╝░░╚════╝░░░░╚═╝░░░╚═╝░░"
echo "     ${bt} ${blue}${wbg} Developed By Ihtisham Ali - Shadow Walker ${reset}"






echo "${bt}"
echo "${cyan}$bt • YouTube: ${yellow}https://youtube.com/ShadowWalkerYT"

echo "${cyan} $bt• GitHub: ${yellow}https://github.com/ShadowWalker005"

echo "${cyan} $bt• Facebook: ${yellow}https://facebook.com/ShadowWalkerYT"

echo "${cyan}$bt • Blogspot: ${yellow}https://shadowhub.blogspot.com"
echo "$reset"
echo 



echo
read -p " ${white}${bt}• ${cyan}${bt}Enter Banner Name:${green}${bt} " banner_name
read -p " ${white}${bt}• ${cyan}${bt}Enter Username:${green}${bt} " user_name



sed -i "s/ihtisham/$user_name/g" $HOME/style/shadowwalker.zsh-theme
sed -i "s/shadow/$banner_name/g" $HOME/style/shadowwalker.zsh-theme

cp -r $HOME/style/shadowwalker.zsh-theme $HOME/.oh-my-zsh/themes
yes "zsh" | chsh > /dev/null 2>&1
rm -rf $HOME/style > /dev/null 2>&1
rm -rf $HOME/install.sh > /dev/null 2>&1
echo
echo
echo "${white}${bt} ${rbg}SUBSCRIBE MY YOUTUBE CHANNEL${reset}"
xdg-open https://youtube.com/ShadowWalkerYT
echo
echo "${green}${bt}"
read -p " Hit Enter To Apply Settings... "
echo "${reset}"
zsh
