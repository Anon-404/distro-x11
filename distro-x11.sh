#! /bin/bash
#
##########################################
#                                        #
#          presented : Anon404           #
#        Author : William Steven         #
#                                        #
##########################################
#
#____colors____
black='\033[1;30m'
red='\033[1;31m'
green='\033[1;32m'
yellow='\033[1;33m'
blue='\033[1;34m'
magenta='\033[1;35m'
cyan='\033[1;36m'
white='\033[1;37m'

banner() {
    clear
    echo -e "${blue}___________________________________________________________"
    echo ""
    echo "    ____  ___________________  ____       _  ________"
    echo "   / __ \/  _/ ___/_  __/ __ \/ __ \     | |/ <  <  /"
    echo "  / / / // / \\__ \\ / / / /_/ / / / /_____|   // // / "
    echo " / /_/ // / ___/ // / / _, _/ /_/ /_____/   |/ // /  "
    echo "/_____/___//____//_/ /_/ |_|\____/     /_/|_/_//_/   "
    echo "                                                     "
    echo -e "${green}presented by : Anon404"
    echo "created by : William Steven"
    echo -e "${blue}"
    echo "___________________________________________________________"
    echo ""
}

pkgInstall(){
        echo -e "${yellow}[+] ${green}updating system${white}"
        echo ""
        pkg update -y
        echo -e "${yellow}[+] ${green}installing x11-repo${white}"
        echo ""
        pkg install x11-repo -y
        for i in proot-distro wget
        do
                echo -e "${yellow}[+] ${green}checking $i installed or not ${white}"
                echo ""
                sleep 2
                if command -v $i > /dev/null 2>&1
                then
                        echo -e "${yellow}[+] ${green}$i is installed ${white}"
                        echo ""
                else
                        echo -e "${yellow}[+] ${green}installing $i ${white}"
                        echo ""
                        pkg install $i -y
                fi
        done
        sleep 2
        echo -e "${yellow}[+] ${green}checking termux-x11 installed or not ${white}"
        echo ""
        sleep 2
        if command -v termux-x11 > /dev/null 2>&1
        then
                echo -e "${yellow}[+] ${green}termux-x11 is installed ${white}"
                echo ""
        else
                echo -e "${yellow}[+] ${green}installing termux-x11${white}"
                echo ""
                pkg install termux-x11-nightly -y
        fi
        sleep 2
}

choise(){
        banner
        echo -e "${yellow}1) Alpine Linux" \
        "\n2) Arch Linux" \
        "\n3) Artix Linux" \
        "\n4) Debian" \
        "\n5) deepin" \
        "\n6) Fedora" \
        "\n7) Manjaro" \
        "\n8) OpenKylin" \
        "\n9) OpenSUSE" \
        "\n10) Pardus" \
        "\n11) Ubuntu" \
        "\n12) Void Linux"
        echo -e "\n${yellow}[+] ${green}enter the number of disto${cyan}"
        read -p ">>> " osn
	if [[ $osn -eq 1 ]] ; then
	        os="alpine"
        	echo $os
	elif [[ $osn -eq 2 ]] ; then
	        os="archlinux"
        	echo $os
	elif [[ $osn -eq 3 ]] ; then
        	os="artix"
	        echo $os
	elif [[ $osn -eq 4 ]] ; then
	        os="debian"
        	echo $os
	elif [[ $osn -eq 5 ]] ; then
        	os="deepin"
	        echo $os
	elif [[ $osn -eq 6 ]] ; then
	        os="fedora"
        	echo $os
        elif [[ $osn -eq 7 ]] ; then
        	os="manjaro"
	        echo $os
        elif [[ $osn -eq 8 ]] ; then
        	os="openkylin"
        	echo $os
        elif [[ $osn -eq 9 ]] ; then
	        os="opensuse"
	        echo $os
	elif [[ $osn -eq 10 ]] ; then
                os="pardus"
                echo $os
        elif [[ $osn -eq 11 ]] ; then
                os="ubuntu"
                echo $os
        elif [[ $osn -eq 12 ]] ; then
                os="void"
                echo $os
        else
		echo -e "${red}[-] wrong option${white}"
		exit 1
        fi
	banner
        echo -e "${yellow}1) XFCE4" \
        "\n2) GNOME" \
        "\n3) FLUXBOX" \
        "\n4) KDE PLASMA"

        echo -e "\n${yellow}[+] ${green}enter the number of desktop environment${cyan}"
        read -p ">>> " den
        if [[ $den -eq 1 ]] ; then
                de="xfce4"
                echo $de
        elif [[ $den -eq 2 ]] ; then
                de="gnome"
                echo $de
        elif [[ $den -eq 3 ]] ; then
                de="fluxbox"
                echo $de
        elif [[ $den -eq 4 ]] ; then
                de="plasma"
                echo $de
        else
                echo -e "${red}[-] wrong option${white}"
                exit 1
        fi

	echo -e "\n${yellow}[+] ${green}installing ${cyan}$os ${green}with ${cyan}$de ${green}desktop environment${white}"
}

distroInstaller(){
        echo -e "${yellow}[+] ${green}checking $os installed or not ${white}"
        echo ""
        sleep 2
        if [ -d /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/$os ]
        then
                echo -e "${yellow}[+] ${green}$os is installed ${white}"
                echo ""
                sleep 2
        else
        echo -e "${yellow}[+] ${green}installing $os on your system${white}"
        echo ""
        sleep 2
        pd i $os
        fi
        if [ -d /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/$os/root ]
        then
                sleep 3
        else
                echo -e "${red}[+] failed to install $os${white}"
                exit 1
        fi
}

allowExternal(){
        echo -e "${yellow}[+] ${green}enabeling termux external view${white}"
        sleep 2
        # echo "allow-external-apps = true" >> ../.termux/termux.properties
        sleep 4

}


userAdding(){
    banner
    echo -e "${yellow}[+] ${green}Installing basic packages on $os${white}"

    if [ "$os" = "alpine" ] ; then
        while ! pd sh $os --shared-tmp -- /bin/bash -c "apk update && apk add sudo"; do
            echo -e "${red}[-] Failed to update and install sudo. Retrying...${white}"
            sleep 2
        done
        for i in wget dialog tzdata sudo which
        do
            echo ""
            echo -e "${yellow}[+] ${green}Installing $i ${white}"
            echo ""
            while ! pd sh $os --shared-tmp -- /bin/bash -c "apk add $i"; do
                echo -e "${red}[-] Failed to install $i. Retrying...${white}"
                sleep 2
            done
            echo -e "${green}[+] Successfully installed $i ${white}"
        done

    elif [ "$os" = "archlinux" ] || [ "$os" = "manjaro" ] || [ "$os" = "artix" ]; then
        while ! pd sh $os --shared-tmp -- /bin/bash -c "pacman -Syu sudo --noconfirm --needed"; do
            echo -e "${red}[-] Failed to update and install sudo. Retrying...${white}"
            sleep 2
        done
        for i in wget dialog tzdata sudo which
        do
            echo ""
            echo -e "${yellow}[+] ${green}Installing $i ${white}"
            echo ""
            while ! pd sh $os --shared-tmp -- /bin/bash -c "pacman -S --noconfirm $i --needed"; do
                echo -e "${red}[-] Failed to install $i. Retrying...${white}"
                sleep 2
            done
            echo -e "${green}[+] Successfully installed $i ${white}"
        done

    elif [ "$os" = "debian" ] || [ "$os" = "deepin" ] || [ "$os" = "ubuntu" ] || [ "$os" = "openkylin" ] || [ "$os" = "pardus" ]; then
        while ! pd sh $os --shared-tmp -- /bin/bash -c "apt update -y && apt install -y sudo"; do
            echo -e "${red}[-] Failed to update and install sudo. Retrying...${white}"
            sleep 2
        done
        for i in wget apt-utils locales-all dialog tzdata sudo which
        do
            echo ""
            echo -e "${yellow}[+] ${green}Installing $i ${white}"
            echo ""
            while ! pd sh $os --shared-tmp -- /bin/bash -c "apt install -y $i"; do
                echo -e "${red}[-] Failed to install $i. Retrying...${white}"
                sleep 2
            done
            echo -e "${green}[+] Successfully installed $i ${white}"
        done

    elif [ "$os" = "fedora" ] ; then
        while ! pd sh $os --shared-tmp -- /bin/bash -c "dnf update -y && dnf install -y sudo"; do
            echo -e "${red}[-] Failed to update and install sudo. Retrying...${white}"
            sleep 2
        done
        for i in wget dialog tzdata sudo which
        do
            echo ""
            echo -e "${yellow}[+] ${green}Installing $i ${white}"
            echo ""
            while ! pd sh $os --shared-tmp -- /bin/bash -c "dnf install -y $i"; do
                echo -e "${red}[-] Failed to install $i. Retrying...${white}"
                sleep 2
            done
            echo -e "${green}[+] Successfully installed $i ${white}"
        done

    elif [ "$os" = "opensuse" ] ; then
        while ! pd sh $os --shared-tmp -- /bin/bash -c "zypper refresh && zypper install -y sudo"; do
            echo -e "${red}[-] Failed to refresh repositories and install sudo. Retrying...${white}"
            sleep 2
        done
        for i in wget dialog tzdata sudo which
        do
            echo ""
            echo -e "${yellow}[+] ${green}Installing $i ${white}"
            echo ""
            while ! pd sh $os --shared-tmp -- /bin/bash -c "zypper install -y $i"; do
                echo -e "${red}[-] Failed to install $i. Retrying...${white}"
                sleep 2
            done
            echo -e "${green}[+] Successfully installed $i ${white}"
        done

    elif [ "$os" = "void" ] ; then
        while ! pd sh $os --shared-tmp -- /bin/bash -c "xbps-install -Syu && xbps-install -y sudo"; do
            echo -e "${red}[-] Failed to update and install sudo. Retrying...${white}"
            sleep 2
        done
        for i in wget dialog tzdata sudo which
        do
            echo ""
            echo -e "${yellow}[+] ${green}Installing $i ${white}"
            echo ""
            while ! pd sh $os --shared-tmp -- /bin/bash -c "xbps-install -y $i"; do
                echo -e "${red}[-] Failed to install $i. Retrying...${white}"
                sleep 2
            done
            echo -e "${green}[+] Successfully installed $i ${white}"
        done

    else
        echo -e "${red}[-] Unknown distro${white}"
        exit 1
    fi
    
    banner
    pd sh $os --shared-tmp -- /bin/bash -c '
    echo -e "\033[1;36m"
    read -p "[+] enter username (lowercase) : " user
    echo -e "\033[1;31m"
    read -p "[+] enter password (lowercase) : " pass
    echo -e ""
    useradd -m -s $(which bash) ${user}
    usermod -aG sudo ${user}
    echo "${user}:${pass}" | chpasswd
    echo "$user ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers '
}

desktopenv(){
    banner
    
    #  Alpine
    
    if [[ "$os" == "alpine" ]] && [[ "$de" == "xfce4" ]] ; then
        echo -e "\n${yellow}[+] ${green}Installing ${cyan}$de ${green}desktop environment on ${cyan}$os Linux ${white}"
    
    elif [[ "$os" == "alpine" ]] && [[ "$de" == "gnome" ]] ; then
        echo -e "\n${yellow}[+] ${green}Installing ${cyan}$de ${green}desktop environment on ${cyan}$os Linux ${white}"
    
    elif [[ "$os" == "alpine" ]] && [[ "$de" == "fluxbox" ]] ; then
        echo -e "\n${yellow}[+] ${green}Installing ${cyan}$de ${green}desktop environment on ${cyan}$os Linux ${white}"
    
    elif [[ "$os" == "alpine" ]] && [[ "$de" == "plasma" ]] ; then
        echo -e "\n${yellow}[+] ${green}Installing ${cyan}$de ${green}desktop environment on ${cyan}$os Linux ${white}"
    
    # Arch, Manjaro, Artix
    
    elif { [[ "$os" == "archlinux" ]] || [[ "$os" == "manjaro" ]] || [[ "$os" == "artix" ]]; } && [[ "$de" == "xfce4" ]] ; then
        echo -e "\n${yellow}[+] ${green}Installing ${cyan}$de ${green}desktop environment on ${cyan}$os Linux ${white}"
    
    elif { [[ "$os" == "archlinux" ]] || [[ "$os" == "manjaro" ]] || [[ "$os" == "artix" ]]; } && [[ "$de" == "gnome" ]] ; then
        echo -e "\n${yellow}[+] ${green}Installing ${cyan}$de ${green}desktop environment on ${cyan}$os Linux ${white}"
    
    elif { [[ "$os" == "archlinux" ]] || [[ "$os" == "manjaro" ]] || [[ "$os" == "artix" ]]; } && [[ "$de" == "fluxbox" ]] ; then
        echo -e "\n${yellow}[+] ${green}Installing ${cyan}$de ${green}desktop environment on ${cyan}$os Linux ${white}"
    
    elif { [[ "$os" == "archlinux" ]] || [[ "$os" == "manjaro" ]] || [[ "$os" == "artix" ]]; } && [[ "$de" == "plasma" ]] ; then
        echo -e "\n${yellow}[+] ${green}Installing ${cyan}$de ${green}desktop environment on ${cyan}$os Linux ${white}"
        ls
    
    # Debian-based: Debian, Deepin, Ubuntu, OpenKylin, Pardus
    
    elif { [[ "$os" == "deepin" ]] || [[ "$os" == "ubuntu" ]] || [[ "$os" == "openkylin" ]] || [[ "$os" == "pardus" ]]; } && [[ "$de" == "xfce4" ]] ; then
        echo -e "${yellow}[+] ${green}Installing ${cyan}$de ${green}desktop environment on ${cyan}$os Linux"
        for i in gnupg2 curl nano git xz-utils at-spi2-core xfce4 xfce4-goodies xfce4-terminal librsvg2-common menu inetutils-tools dialog exo-utils dbus-x11 gtk2-engines-murrine gtk2-engines-pixbuf apt-transport-https
        do
            echo ""
            echo -e "${yellow}[+] ${green}Installing $i ${white}"
            echo ""
            while ! pd sh $os --user ubuntu --shared-tmp -- /bin/bash -c "apt install -y $i"; do
                echo -e "${red}[-] Failed to install $i. Retrying...${white}"
                sleep 2
            done
            echo -e "${green}[+] Successfully installed $i ${white}"
        done

    elif { [[ "$os" == "deepin" ]] || [[ "$os" == "ubuntu" ]] || [[ "$os" == "openkylin" ]] || [[ "$os" == "pardus" ]]; } && [[ "$de" == "gnome" ]] ; then
        echo -e "\n${yellow}[+] ${green}Installing ${cyan}$de ${green}desktop environment on ${cyan}$os Linux ${white}"
    
    elif { [[ "$os" == "deepin" ]] || [[ "$os" == "ubuntu" ]] || [[ "$os" == "openkylin" ]] || [[ "$os" == "pardus" ]]; } && [[ "$de" == "fluxbox" ]] ; then
        echo -e "\n${yellow}[+] ${green}Installing ${cyan}$de ${green}desktop environment on ${cyan}$os Linux ${white}"
    
    elif { [[ "$os" == "deepin" ]] || [[ "$os" == "ubuntu" ]] || [[ "$os" == "openkylin" ]] || [[ "$os" == "pardus" ]]; } && [[ "$de" == "plasma" ]] ; then
        echo -e "\n${yellow}[+] ${green}Installing ${cyan}$de ${green}desktop environment on ${cyan}$os Linux ${white}"
    
    # Fedora
    
    elif [[ "$os" == "fedora" ]] && [[ "$de" == "xfce4" ]] ; then
        echo -e "\n${yellow}[+] ${green}Installing ${cyan}$de ${green}desktop environment on ${cyan}$os Linux ${white}"
    
    elif [[ "$os" == "fedora" ]] && [[ "$de" == "gnome" ]] ; then
        echo -e "\n${yellow}[+] ${green}Installing ${cyan}$de ${green}desktop environment on ${cyan}$os Linux ${white}"
    
    elif [[ "$os" == "fedora" ]] && [[ "$de" == "fluxbox" ]] ; then
        echo -e "\n${yellow}[+] ${green}Installing ${cyan}$de ${green}desktop environment on ${cyan}$os Linux ${white}"
    
    elif [[ "$os" == "fedora" ]] && [[ "$de" == "plasma" ]] ; then
        echo -e "\n${yellow}[+] ${green}Installing ${cyan}$de ${green}desktop environment on ${cyan}$os Linux ${white}"
    
    # OpenSUSE
    
    elif [[ "$os" == "opensuse" ]] && [[ "$de" == "xfce4" ]] ; then
        echo -e "\n${yellow}[+] ${green}Installing ${cyan}$de ${green}desktop environment on ${cyan}$os Linux ${white}"
    
    elif [[ "$os" == "opensuse" ]] && [[ "$de" == "gnome" ]] ; then
        echo -e "\n${yellow}[+] ${green}Installing ${cyan}$de ${green}desktop environment on ${cyan}$os Linux ${white}"
    
    elif [[ "$os" == "opensuse" ]] && [[ "$de" == "fluxbox" ]] ; then
        echo -e "\n${yellow}[+] ${green}Installing ${cyan}$de ${green}desktop environment on ${cyan}$os Linux ${white}"
    
    elif [[ "$os" == "opensuse" ]] && [[ "$de" == "plasma" ]] ; then
        echo -e "\n${yellow}[+] ${green}Installing ${cyan}$de ${green}desktop environment on ${cyan}$os Linux ${white}"
    
    # Void
    
    elif [[ "$os" == "void" ]] && [[ "$de" == "xfce4" ]] ; then
        echo -e "\n${yellow}[+] ${green}Installing ${cyan}$de ${green}desktop environment on ${cyan}$os Linux ${white}"
    
    elif [[ "$os" == "void" ]] && [[ "$de" == "gnome" ]] ; then
        echo -e "\n${yellow}[+] ${green}Installing ${cyan}$de ${green}desktop environment on ${cyan}$os Linux ${white}"
    
    elif [[ "$os" == "void" ]] && [[ "$de" == "fluxbox" ]] ; then
        echo -e "\n${yellow}[+] ${green}Installing ${cyan}$de ${green}desktop environment on ${cyan}$os Linux ${white}"
        
    elif [[ "$os" == "void" ]] && [[ "$de" == "plasma" ]] ; then
        echo -e "\n${yellow}[+] ${green}Installing ${cyan}$de ${green}desktop environment on ${cyan}$os Linux ${white}"
    
    else 
        echo -e "${red}[-] Unknown distro and desktop environment ${white}"
        exit 1
    fi
}

main(){
    choise
    #pkgInstall
    #distroInstaller
    #allowExternal # half
    #userAdding
    desktopenv
}

main
