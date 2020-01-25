#!/bin/bash
show_menus() {
	clear
        echo -e "${YELLOW}\
        
     ██▀███   █    ██ ▓█████▄  ██▀███   ▄▄▄      
    ▓██ ▒ ██▒ ██  ▓██▒▒██▀ ██▌▓██ ▒ ██▒▒████▄    
    ▓██ ░▄█ ▒▓██  ▒██░░██   █▌▓██ ░▄█ ▒▒██  ▀█▄  
    ▒██▀▀█▄  ▓▓█  ░██░░▓█▄   ▌▒██▀▀█▄  ░██▄▄▄▄██ 
    ░██▓ ▒██▒▒▒█████▓ ░▒████▓ ░██▓ ▒██▒ ▓█   ▓██▒
    ░ ▒▓ ░▒▓░░▒▓▒ ▒ ▒  ▒▒▓  ▒ ░ ▒▓ ░▒▓░ ▒▒   ▓▒█░
      ░▒ ░ ▒░░░▒░ ░ ░  ░ ▒  ▒   ░▒ ░ ▒░  ▒   ▒▒ ░
      ░░   ░  ░░░ ░ ░  ░ ░  ░   ░░   ░   ░   ▒   
       ░        ░        ░       ░           ░  ░
                   ░                         
       	     Third Eye of your machine.
                !! MADE IN BHARAT !!
 
                                                                       
        ${SET}"
    echo -e "${BLUE}             BY: ESHAN SINGH (R0X4R)${SET}"
    echo "Tools:"
    echo "   1. Install dependencies [GO, Python3, Ruby, Rust, Chromium, more...]"
    echo "   2. Amass"
    echo "   3. Aquatone"
    echo "   4. Dirsearch"
    echo "   5. EyeWitness"
    echo "   6. Fast web fuzzer (ffuf)"
    echo "   7. Findomain"
    echo "   8. FinalRecon"
    echo "   9. getJS"
    echo "  10. GitGraber"
    echo "  11. GraphQLmap"
    echo "  12. Httprobe"
    echo "  13. Imago"
    echo "  14. LinkFinder"
    echo "  15. Masscan"
    echo "  16. MassDNS"
    echo "  17. Meg"
    echo "  18. Nmap"
    echo "  19. Sublist3r"
    echo "  20. Subjack"
    echo "  21. truffleHog"
    echo "  22. WhatWeb"
    echo "  23. Waybackurls"
    echo -e "\n\n  33. Install all tools"
    echo -e "  44. Exit\n"
}

read_option(){
	local choice
	read -p "Enter choice [ 1 - 44] " choice
	case $choice in
        1) install_dependencies ;;
	2) install_amass ;;
	3) install_aquatone ;;
	4) install_dirsearch ;;
	5) install_eyewitness ;;
	6) install_ffuf ;;
	7) install_findomain ;;
	8) install_FinalRecon ;;
	9) install_getjs ;;
	10) install_gitGraber ;;
	11) install_GraphQLmap ;;
	12) install_httprobe ;;
        13) install_Imago ;;
        14) install_linkfinder ;;
        15) install_masscan ;;
        16) install_massdns ;;
        17) install_meg ;;
        18) install_nmap ;;
        19) install_sublist3r ;;
        20) install_subjack ;;
        21) install_truffleHog ;;
        22) install_whatweb ;;
        23) install_waybackurls ;;
        33) install_all ;;
	44) exit 0;;
	*) echo -e "${RED}Error...${SET}" && sleep 2
	esac
}

pause(){
  read -p "Press [Enter] key to continue..." fackEnterKey
}
 
load_colors() {
    # https://www.shellhacks.com/bash-colors/
    DARKGRAY='\033[1;30m'
    RED='\033[0;31m'    
    LIGHTRED='\033[1;31m'
    GREEN='\033[0;32m'    
    YELLOW='\033[1;33m'
    BLUE='\033[0;34m'    
    PURPLE='\033[0;35m'    
    LIGHTPURPLE='\033[1;35m'
    CYAN='\033[0;36m'    
    WHITE='\033[1;37m'
    SET='\033[0m'
}

install_dependencies() {
    echo -e "${GREEN}Installing tools' dependencies ${SET}"
    sudo add-apt-repository ppa:longsleep/golang-backports
    sudo apt-get update && sudo apt-get -y upgrade
    sudo apt-get install -y golang-go build-essential python3 python3-dev wget unzip chromium-browser gcc make libpcap-dev python3-pip ruby-full
    sudo ln -s /usr/bin/python3 /usr/bin/python
    curl https://sh.rustup.rs -sSf | sh
    source $HOME/.cargo/env
    echo -e "${YELLOW}Finished installing tools' dependencies ${SET}\n"
    pause
}

install_amass() {
    # https://github.com/OWASP/Amass
    echo -e "${GREEN}Installing Amass ${SET}"
    go get -u github.com/OWASP/Amass/...
    sudo cp $HOME/go/bin/amass /usr/local/bin
    echo -e "${YELLOW}Finished installing Amass ${SET}\n"
    pause
}

install_aquatone() {
    # https://github.com/michenriksen/aquatone
    echo -e "${GREEN}Installing aquatone ${SET}"
    wget https://github.com/michenriksen/aquatone/releases/download/v1.7.0/aquatone_linux_amd64_1.7.0.zip -O $HOME/tools/aquatone.zip
    cd $HOME/tools && unzip aquatone.zip -d $HOME/tools/aquatone && sudo cp $HOME/tools/aquatone/aquatone /usr/local/bin
    sudo rm -r $HOME/tools/aquatone && rm $HOME/tools/aquatone.zip
    echo -e "${YELLOW}Finished installing aquatone ${SET}\n"
    pause
}

install_dirsearch() {
    echo -e "${GREEN}Installing dirsearch ${SET}"
    git clone https://github.com/maurosoria/dirsearch.git $HOME/tools/dirsearch
    add_to_path dirsearch
    ln -sf $HOME/tools/dirsearch/dirsearch.py $HOME/tools/dirsearch/dirsearch && chmod +x $HOME/tools/dirsearch/dirsearch
    echo -e "${YELLOW}Finished installing dirsearch ${SET}\n"
    pause
}

install_eyewitness() {
    # https://github.com/FortyNorthSecurity/EyeWitness
    echo -e "${GREEN}Installing EyeWitness ${SET}"
    git clone https://github.com/FortyNorthSecurity/EyeWitness.git $HOME/tools/eyewitness
    cd $HOME/tools/eyewitness/setup && sudo ./setup.sh
    echo -e "\n\n${RED}Run this tool from ${HOME}/tools/eyewitness - [./EyeWitness.py -h] ${SET}\n"
    echo -e "${YELLOW}Finished installing EyeWitness ${SET}\n"
    pause
}

install_ffuf() {
    # https://github.com/ffuf/ffuf
    echo -e "${GREEN}Installing Fast web fuzzer (ffuf) ${SET}"
    go get -u github.com/ffuf/ffuf
    sudo cp $HOME/go/bin/ffuf /usr/local/bin
    echo -e "${YELLOW}Finished installing Fast web fuzzer (ffuf) ${SET}\n"
    pause
}

install_findomain() {
    # https://github.com/Edu4rdSHL/findomain
    echo -e "${GREEN}Installing findomain ${SET}"
    git clone https://github.com/Edu4rdSHL/findomain.git $HOME/tools/findomain
    cd $HOME/tools/findomain && cargo build --release && sudo cp $HOME/tools/findomain/target/release/findomain /usr/local/bin
    sudo rm -r $HOME/tools/findomain
    echo -e "${YELLOW}Finished installing findomain ${SET}\n"
    pause
}

install_FinalRecon() {
    # https://github.com/thewhiteh4t/FinalRecon
    echo -e "${GREEN}Installing FinalRecon ${SET}"
    git clone https://github.com/thewhiteh4t/FinalRecon.git $HOME/tools/FinalRecon
    cd $HOME/tools/FinalRecon && pip3 install -r requirements.txt
    echo -e "\n\n${RED}Run this tool from ${HOME}/tools/FinalRecon - [python3 finalrecon.py -h] ${SET}\n"
    echo -e "${YELLOW}Finished installing FinalRecon ${SET}\n"
    pause
}

install_getjs() {
    # https://github.com/003random/getJS
    echo -e "${GREEN}Installing getJS ${SET}"
    go get github.com/003random/getJS
    sudo cp $HOME/go/bin/getJS /usr/local/bin
    echo -e "${YELLOW}Finished installing getJS ${SET}\n"
    pause
}

install_gitGraber() {
    # https://github.com/hisxo/gitGraber.git
    echo -e "${GREEN}Installing gitGraber ${SET}"
    git clone https://github.com/hisxo/gitGraber.git $HOME/tools/gitGraber
    cd $HOME/tools/gitGraber && pip3 install -r requirements.txt
    echo -e "\n\n${RED}Run this tool from ${HOME}/tools/gitGraber ${SET}\n"
    echo -e "${YELLOW}Finished installing gitGraber ${SET}\n"
    pause
}

install_GraphQLmap() {
    # https://github.com/swisskyrepo/GraphQLmap
    echo -e "${GREEN}Installing GraphQLmap ${SET}"
    git clone https://github.com/swisskyrepo/GraphQLmap.git $HOME/tools/GraphQLmap
    echo -e "\n\n${RED}Run this tool from ${HOME}/tools/GraphQLmap - [python graphqlmap.py -h] ${SET}\n"
    echo -e "${YELLOW}Finished installing GraphQLmap ${SET}\n"
    pause
}

install_httprobe() {
    # https://github.com/tomnomnom/httprobe
    echo -e "${GREEN}Installing httprobe ${SET}"
    go get -u github.com/tomnomnom/httprobe
    sudo cp $HOME/go/bin/httprobe /usr/local/bin
    echo -e "${YELLOW}Finished installing httprobe ${SET}\n"
    pause
}

install_Imago() {
    # https://github.com/R0X4R/imago-forensics
    echo -e "${GREEN}Installing Imago ${SET}"
    pip install imago
    echo -e "\n\n${RED}Run this tool by imago command - [imago -h] ${SET}\n"
    echo -e "${YELLOW}Finished installing Imago ${SET}\n"
    pause
}

install_linkfinder() {
    # https://github.com/GerbenJavado/LinkFinder
    echo -e "${GREEN}Installing LinkFinder ${SET}"
    git clone https://github.com/GerbenJavado/LinkFinder.git $HOME/tools/LinkFinder
    pip3 install --no-cache-dir --install-option="--prefix=/install" -r $HOME/tools/LinkFinder/requirements.txt
    add_to_path LinkFinder
    ln -sf $HOME/tools/LinkFinder/linkfinder.py $HOME/tools/LinkFinder/linkfinder && chmod +x $HOME/tools/LinkFinder/linkfinder
    echo -e "${YELLOW}Finished installing LinkFinder ${SET}\n"
    pause
}

install_masscan() {
    # https://github.com/robertdavidgraham/masscan
    echo -e "${GREEN}Installing masscan ${SET}"
    git clone https://github.com/robertdavidgraham/masscan $HOME/tools/masscan
    cd $HOME/tools/masscan && make -j && sudo cp $HOME/tools/masscan/bin/masscan /usr/local/bin
    sudo rm -r $HOME/tools/masscan
    echo -e "${YELLOW}Finished installing masscan ${SET}\n"
    pause
}

install_massdns() {
    # https://github.com/blechschmidt/massdns
    echo -e "${GREEN}Installing MassDNS ${SET}"
    git clone https://github.com/blechschmidt/massdns.git $HOME/tools/massdns
    cd $HOME/tools/massdns && sudo make && sudo cp $HOME/tools/massdns/bin/massdns /usr/local/bin
    echo -e "${YELLOW}Finished installing MassDNS ${SET}\n"
    pause
}

install_meg() {
    # https://github.com/tomnomnom/meg
    echo -e "${GREEN}Installing Meg ${SET}"
    go get github.com/tomnomnom/meg
    sudo cp $HOME/go/bin/meg /usr/local/bin
    echo -e "${YELLOW}Finished installing Meg ${SET}\n"
    pause
}

install_nmap() {
    # https://github.com/OWASP/Amass
    echo -e "${GREEN}Installing Nmap ${SET}"
    sudo apt-get install -y nmap
    echo -e "${YELLOW}Finished installing Nmap ${SET}\n"
    pause
}

install_sublist3r() {
    # https://github.com/aboul3la/Sublist3r
    echo -e "${GREEN}Installing sublist3r ${SET}"
    git clone https://github.com/aboul3la/Sublist3r.git $HOME/tools/sublist3r
    pip3 install --no-cache-dir --install-option="--prefix=/install" -r $HOME/tools/sublist3r/requirements.txt
    add_to_path sublist3r
    ln -sf $HOME/tools/sublist3r/sublist3r.py $HOME/tools/sublist3r/sublist3r && chmod +x $HOME/tools/sublist3r/sublist3r
    echo -e "${YELLOW}Finished installing sublist3r ${SET}\n"
    pause
}

install_subjack() {
    # https://github.com/haccer/subjack
    echo -e "${GREEN}Installing Subjack ${SET}"
    go get github.com/haccer/subjack
    sudo cp $HOME/go/bin/subjack /usr/local/bin
    echo -e "${YELLOW}Finished installing Subjack ${SET}\n"
    pause
}

install_truffleHog() {
    # https://github.com/dxa4481/truffleHog
    echo -e "${GREEN}Installing truffleHog ${SET}"
    pip install truffleHog
    echo -e "\n\n${RED}Run this tool by trufflehog command - [trufflehog -h] ${SET}\n"
    echo -e "${YELLOW}Finished installing truffleHog ${SET}\n"
    pause
}

install_whatweb() {
    # https://github.com/urbanadventurer/WhatWeb
    echo -e "${GREEN}Installing WhatWeb ${SET}"
    git clone https://github.com/urbanadventurer/WhatWeb.git $HOME/tools/whatweb
    cd $HOME/tools/whatweb && sudo gem install bundler && bundle install
    add_to_path whatweb    
    echo -e "${YELLOW}Finished installing WhatWeb ${SET}\n"
    pause
}

install_waybackurls() {
    # https://github.com/tomnomnom/waybackurls
    echo -e "${GREEN}Installing Waybackurls ${SET}"
    go get github.com/tomnomnom/waybackurls
    sudo cp $HOME/go/bin/waybackurls /usr/local/bin
    echo -e "${YELLOW}Finished installing Waybackurls ${SET}\n"
    pause
}

add_to_path() {
    if [[ ":$PATH:" == *":$HOME/tools/$1:"* ]] || grep -q "$HOME/tools/$1" $HOME/.bash_profile; then
        echo -e "${RED}$1 dir already in path${SET}"
    else
        PATH_EXPORT=$(sed -n "/export PATH/p" ~/.bash_profile)
        if [ -z "$PATH_EXPORT" ]; then
            PATH_EXPORT=$PATH:$HOME/tools/$1
            echo $PATH_EXPORT
            echo "export PATH=${PATH_EXPORT}" >> $HOME/.bash_profile && source $HOME/.bash_profile
        else
            PATH_EXPORT=$(sed -n "/export PATH/p" ~/.bash_profile):$HOME/tools/$1
            echo $PATH_EXPORT
            sed -i '/^export PATH/d' $HOME/.bash_profile > $HOME/.bash_profile
            echo "export PATH=${PATH_EXPORT}" >> $HOME/.bash_profile && source $HOME/.bash_profile
        fi
        echo -e "${GREEN}Added $1 to PATH ${SET}"
    fi
}

install_all () {
    install_amass
    install_aquatone
    install_dirsearch
    install_eyewitness
    install_ffuf
    install_findomain
    install_FinalRecon
    install_getjs
    install_gitGraber
    install_GraphQLmap
    install_httprobe
    install_Imago
    install_linkfinder
    install_masscan
    install_massdns
    install_meg
    install_nmap
    install_sublist3r
    install_subjack
    install_truffleHog
    install_whatweb
    install_waybackurls
    pause
}

trap '' SIGINT SIGQUIT SIGTSTP

while true
do
    load_colors
    show_menus
    read_option
done
