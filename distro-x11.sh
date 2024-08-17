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
    echo -e "${blue}________________________________________________________________"
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
    echo "________________________________________________________________"
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
        
        
        
        if { [[ "$os" == "archlinux" ]] || [[ "$os" == "manjaro" ]] || [[ "$os" == "artix" ]]; } ; then
            echo -e "${yellow}[+] ${green}Configuring pacman${white}"
	        rm -rf /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/$os/etc/pacman.conf
	        wget https://raw.githubusercontent.com/Anon-404/My-assets/main/archlinux/pacman.conf -O /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/$os/etc/pacman.conf
	        chmod 444 /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/$os/etc/pacman.conf
        fi
        
}

allowExternal(){
        echo -e "${yellow}[+] ${green}enabeling termux external view${white}"
        sleep 2
        # echo "allow-external-apps = true" >> ../.termux/termux.properties
        sleep 4

}


Bpkgs(){
    banner
    echo -e "${yellow}[+] ${green}Installing basic packages on $os${white}"

    if [ "$os" = "alpine" ] ; then
        while ! pd sh $os --shared-tmp -- /bin/bash -c "apk update && apk add sudo"; do
            echo -e "${red}[-] Failed to update and install sudo. Retrying...${white}"
            sleep 2
        done
        for i in wget dialog tzdata sudo which fish neofetch
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
        for i in wget dialog tzdata sudo which fish neofetch
        do
            echo ""
            echo -e "${yellow}[+] ${green}Installing $i ${white}"
            echo ""
            while ! pd sh $os --shared-tmp -- /bin/bash -c "if [ -f /var/lib/pacman/db.lck ]; then rm -rf /var/lib/pacman/db.lck; fi && pacman -S --noconfirm $i --needed"; do
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
        for i in wget apt-utils locales-all dialog tzdata sudo which fish neofetch
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
        for i in wget dialog tzdata sudo which fish neofetch
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
        for i in wget dialog tzdata sudo which fish neofetch
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
        for i in wget dialog tzdata sudo which fish neofetch
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
    
}

desktopenv(){
    banner
    
    #  Alpine
    
    if [[ "$os" == "alpine" ]] && [[ "$de" == "xfce4" ]] ; then
        echo -e "\n${yellow}[+] ${green}Installing ${cyan}$de ${green}desktop environment on ${cyan}$os Linux ${white}"
        
        
        for i in gnupg curl nano git xz at-spi2-core xfce4 xfce4-terminal librsvg dialog exo dbus gtk-engines-murrine gtk-engines-pixbuf neofetch fish
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
        echo "$user ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers 
    
         wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/candy-icons-master.tar.xz 
         wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/Sweet-Ambar-Blue-Dark-v40.tar.xz 
         wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/01-WhiteSur.tar.xz 
         wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/WhiteSur-Dark.tar.xz 
        wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/Sweet-cursors.tar.xz 
         wget https://raw.githubusercontent.com/Anon-404/My-assets/main/distro-x11/gnome/Sweet-Wallpapers.tar.xz
         wget https://raw.githubusercontent.com/Anon-404/My-assets/main/archlinux/com0613.jpg -O /usr/share/backgrounds/com0613.jpg
         wget https://raw.githubusercontent.com/Anon-404/My-assets/main/distro-x11/xfce4/config.tar.xz
         
        echo "clear" >> /home/$user/.bashrc
        echo "neofetch" >> /home/$user/.bashrc
        echo "fish" >> /home/$user/.bashrc
        
        
        echo "#! /bin/bash" >> $os
        echo "" >> $os
        echo "termux-x11 :1 &" >> $os
        echo "pd sh $os --user $user --shared-tmp " >> $os
        chmod 777 $os
        mv $os /data/data/com.termux/files/usr/bin
        chmod 777 /data/data/com.termux/files/usr/bin/$os
        
        echo "#! /bin/bash" >> x11-start
        echo "" >> x11-start
        echo "export DISPLAY=:1" >> x11-start
        echo "xfce4-session" >> x11-start
        chmod 777 x11-start
        mv xfce4-session /usr/bin
        chmod 777 /usr/bin/x11-start
        
        

         sudo rm -rf /home/$user/.config
         sudo tar -xvf Sweet-cursors.tar.xz -C "/usr/share/icons"
         tar -xvf Sweet-Wallpapers.tar.xz -C "/usr/share/backgrounds"
         sudo tar -xvf Sweet-Ambar-Blue-Dark-v40.tar.xz -C "/usr/share/themes/"
         sudo tar -xvf candy-icons-master.tar.xz -C "/usr/share/icons"
         sudo tar -xvf WhiteSur-Dark.tar.xz -C "/usr/share/themes"
         sudo tar -xvf 01-WhiteSur.tar.xz -C "/usr/share/icons"
         sudo tar -xvf config.tar.xz -C "/home/$user/" '
        
        
    
    elif [[ "$os" == "alpine" ]] && [[ "$de" == "gnome" ]] ; then
    echo -e "\n${yellow}[+] ${green}Installing ${cyan}$de ${green}desktop environment on ${cyan}$os Linux ${white}"
    
    for i in gnupg curl nano git xz at-spi2-core gnome gnome-shell gnome-terminal gnome-tweaks nautilus gedit librsvg menu inetutils dialog exo gtk2 dbus neofetch fish
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
        
    banner
    pd sh $os --shared-tmp -- /bin/bash -c '
    echo -e "\033[1;36m"
    read -p "[+] enter username (lowercase) : " user
    echo -e "\033[1;31m"
    read -p "[+] enter password (lowercase) : " pass
    echo -e ""
    useradd -m -s $(which bash) ${user}
    usermod -aG wheel ${user}
    echo "${user}:${pass}" | chpasswd
    echo "$user ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers 

    wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/candy-icons-master.tar.xz 
    wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/Sweet-Ambar-Blue-Dark-v40.tar.xz 
    wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/01-WhiteSur.tar.xz 
    wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/WhiteSur-Dark.tar.xz 
    wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/Sweet-cursors.tar.xz 
    wget https://raw.githubusercontent.com/Anon-404/My-assets/main/distro-x11/gnome/Sweet-Wallpapers.tar.xz
    wget https://raw.githubusercontent.com/Anon-404/My-assets/main/distro-x11/gnome/gnome-config.tar.xz
    
    echo "clear" >> /home/$user/.bashrc
    echo "neofetch" >> /home/$user/.bashrc
    echo "fish" >> /home/$user/.bashrc
    
    
    echo "#! /bin/bash" >> $os
    echo "" >> $os
    echo "termux-x11 :1 &" >> $os
    echo "pd sh $os --user $user --shared-tmp " >> $os
    chmod 777 $os
    mv $os /data/data/com.termux/files/usr/bin
    chmod 777 /data/data/com.termux/files/usr/bin/$os
    
    
    echo "#! /bin/bash" >> x11-start
    echo "" >> x11-start
    echo "for file in $(find /usr -type f -iname "*login1*"); do rm -rf $file; done" >> x11-start
    echo "export DISPLAY=:1" >> x11-start
    echo "service dbus start" >> x11-start
    echo "gnome-shell --x11" >> x11-start
    
    chmod 777 x11-start
    mv xfce4-session /usr/bin
    chmod 777 /usr/bin/x11-start
    
    rm -rf /home/$user/.config
    mkdir /home/$user/.config
    
    tar -xvf Sweet-cursors.tar.xz -C "/usr/share/icons"
    tar -xvf Sweet-Wallpapers.tar.xz -C "/usr/share/backgrounds"
    tar -xvf Sweet-Ambar-Blue-Dark-v40.tar.xz -C "/usr/share/themes/"
    tar -xvf candy-icons-master.tar.xz -C "/usr/share/icons"
    tar -xvf WhiteSur-Dark.tar.xz -C "/usr/share/themes"
    tar -xvf 01-WhiteSur.tar.xz -C "/usr/share/icons"
    tar -xvf gnome-config.tar.xz -C "/home/$user/.config" '
    
    
    
    elif [[ "$os" == "alpine" ]] && [[ "$de" == "fluxbox" ]] ; then
        echo -e "\n${yellow}[+] ${green}Installing ${cyan}$de ${green}desktop environment on ${cyan}$os Linux ${white}"
    
    elif [[ "$os" == "alpine" ]] && [[ "$de" == "plasma" ]] ; then
        echo -e "\n${yellow}[+] ${green}Installing ${cyan}$de ${green}desktop environment on ${cyan}$os Linux ${white}"
    
    # Arch, Manjaro, Artix
    
    elif { [[ "$os" == "archlinux" ]] || [[ "$os" == "manjaro" ]] || [[ "$os" == "artix" ]]; } && [[ "$de" == "xfce4" ]] ; then
        echo -e "\n${yellow}[+] ${green}Installing ${cyan}$de ${green}desktop environment on ${cyan}$os Linux ${white}"
        
        
        for i in gnupg curl nano git xz at-spi2-core xfce4 xfce4-goodies xfce4-terminal librsvg inetutils dialog exo dbus gtk-engine-murrine neofetch fish
        do
            echo ""
            echo -e "${yellow}[+] ${green}Installing $i ${white}"
            echo ""
            while ! pd sh $os --shared-tmp -- /bin/bash -c "if [ -f /var/lib/pacman/db.lck ]; then rm -rf /var/lib/pacman/db.lck; fi && pacman -S --noconfirm $i --needed"; do
                echo -e "${red}[-] Failed to install $i. Retrying...${white}"
                sleep 2
            done
            echo -e "${green}[+] Successfully installed $i ${white}"
        done
        
        
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
        echo "$user ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers 
    
         wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/candy-icons-master.tar.xz 
         wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/Sweet-Ambar-Blue-Dark-v40.tar.xz 
         wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/01-WhiteSur.tar.xz 
         wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/WhiteSur-Dark.tar.xz 
        wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/Sweet-cursors.tar.xz 
         wget https://raw.githubusercontent.com/Anon-404/My-assets/main/distro-x11/gnome/Sweet-Wallpapers.tar.xz
         wget https://raw.githubusercontent.com/Anon-404/My-assets/main/archlinux/com0613.jpg -O /usr/share/backgrounds/com0613.jpg
         wget https://raw.githubusercontent.com/Anon-404/My-assets/main/distro-x11/xfce4/config.tar.xz
         
        echo "clear" >> /home/$user/.bashrc
        echo "neofetch" >> /home/$user/.bashrc
        echo "fish" >> /home/$user/.bashrc
        
        
        echo "#! /bin/bash" >> $os
        echo "" >> $os
        echo "termux-x11 :1 &" >> $os
        echo "pd sh $os --user $user --shared-tmp " >> $os
        chmod 777 $os
        mv $os /data/data/com.termux/files/usr/bin
        chmod 777 /data/data/com.termux/files/usr/bin/$os
        
        echo "#! /bin/bash" >> x11-start
        echo "" >> x11-start
        echo "export DISPLAY=:1" >> x11-start
        echo "xfce4-session" >> x11-start
        chmod 777 x11-start
        mv xfce4-session /usr/bin
        chmod 777 /usr/bin/x11-start
        

         sudo rm -rf /home/$user/.config
         sudo tar -xvf Sweet-cursors.tar.xz -C "/usr/share/icons"
         tar -xvf Sweet-Wallpapers.tar.xz -C "/usr/share/backgrounds"
         sudo tar -xvf Sweet-Ambar-Blue-Dark-v40.tar.xz -C "/usr/share/themes/"
         sudo tar -xvf candy-icons-master.tar.xz -C "/usr/share/icons"
         sudo tar -xvf WhiteSur-Dark.tar.xz -C "/usr/share/themes"
         sudo tar -xvf 01-WhiteSur.tar.xz -C "/usr/share/icons"
         sudo tar -xvf config.tar.xz -C "/home/$user/" '

    
    elif { [[ "$os" == "archlinux" ]] || [[ "$os" == "manjaro" ]] || [[ "$os" == "artix" ]]; } && [[ "$de" == "gnome" ]] ; then
    echo -e "\n${yellow}[+] ${green}Installing ${cyan}$de ${green}desktop environment on ${cyan}$os Linux ${white}"
    
    for i in gnupg curl nano git xz at-spi2-core gnome gnome-shell gnome-terminal gnome-tweaks gnome-shell-extensions nautilus gedit librsvg inetutils dialog exo dbus gtk-engine-murrine gtk-engines neofetch fish
    do
        echo ""
        echo -e "${yellow}[+] ${green}Installing $i ${white}"
        echo ""
        while ! pd sh $os --shared-tmp -- /bin/bash -c "pacman -S --noconfirm $i"; do
            echo -e "${red}[-] Failed to install $i. Retrying...${white}"
            sleep 2
        done
        echo -e "${green}[+] Successfully installed $i ${white}"
    done
        
    banner
    pd sh $os --shared-tmp -- /bin/bash -c '
    echo -e "\033[1;36m"
    read -p "[+] enter username (lowercase) : " user
    echo -e "\033[1;31m"
    read -p "[+] enter password (lowercase) : " pass
    echo -e ""
    useradd -m -s $(which bash) ${user}
    usermod -aG wheel ${user}
    echo "${user}:${pass}" | chpasswd
    echo "$user ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers 

    wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/candy-icons-master.tar.xz 
    wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/Sweet-Ambar-Blue-Dark-v40.tar.xz 
    wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/01-WhiteSur.tar.xz 
    wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/WhiteSur-Dark.tar.xz 
    wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/Sweet-cursors.tar.xz 
    wget https://raw.githubusercontent.com/Anon-404/My-assets/main/distro-x11/gnome/Sweet-Wallpapers.tar.xz
    wget https://raw.githubusercontent.com/Anon-404/My-assets/main/distro-x11/gnome/gnome-config.tar.xz
    
    echo "clear" >> /home/$user/.bashrc
    echo "neofetch" >> /home/$user/.bashrc
    echo "fish" >> /home/$user/.bashrc
    
    echo "#! /bin/bash" >> $os
    echo "" >> $os
    echo "termux-x11 :1 &" >> $os
    echo "pd sh $os --user $user --shared-tmp " >> $os
    chmod 777 $os
    mv $os /data/data/com.termux/files/usr/bin
    chmod 777 /data/data/com.termux/files/usr/bin/$os
    
    
    echo "#! /bin/bash" >> x11-start
    echo "" >> x11-start
    echo "for file in $(find /usr -type f -iname "*login1*"); do rm -rf $file; done" >> x11-start
    echo "export DISPLAY=:1" >> x11-start
    echo "service dbus start" >> x11-start
    echo "gnome-shell --x11" >> x11-start
    

    rm -rf /home/$user/.config
    mkdir /home/$user/.config
    
    tar -xvf Sweet-cursors.tar.xz -C "/usr/share/icons"
    tar -xvf Sweet-Wallpapers.tar.xz -C "/usr/share/backgrounds"
    tar -xvf Sweet-Ambar-Blue-Dark-v40.tar.xz -C "/usr/share/themes/"
    tar -xvf candy-icons-master.tar.xz -C "/usr/share/icons"
    tar -xvf WhiteSur-Dark.tar.xz -C "/usr/share/themes"
    tar -xvf 01-WhiteSur.tar.xz -C "/usr/share/icons"
    tar -xvf gnome-config.tar.xz -C "/home/$user/.config" '
        
        
    
    elif { [[ "$os" == "archlinux" ]] || [[ "$os" == "manjaro" ]] || [[ "$os" == "artix" ]]; } && [[ "$de" == "fluxbox" ]] ; then
        echo -e "\n${yellow}[+] ${green}Installing ${cyan}$de ${green}desktop environment on ${cyan}$os Linux ${white}"
    
    elif { [[ "$os" == "archlinux" ]] || [[ "$os" == "manjaro" ]] || [[ "$os" == "artix" ]]; } && [[ "$de" == "plasma" ]] ; then
        echo -e "\n${yellow}[+] ${green}Installing ${cyan}$de ${green}desktop environment on ${cyan}$os Linux ${white}"
    
    
    # Debian-based: Debian, Deepin, Ubuntu, OpenKylin, Pardus
    
    elif { [[ "$os" == "deepin" ]] || [[ "$os" == "debian" ]] || [[ "$os" == "ubuntu" ]] || [[ "$os" == "openkylin" ]] || [[ "$os" == "pardus" ]]; } && [[ "$de" == "xfce4" ]] ; then
        echo -e "${yellow}[+] ${green}Installing ${cyan}$de ${green}desktop environment on ${cyan}$os Linux"
        for i in gnupg2 curl nano git xz-utils at-spi2-core xfce4 xfce4-goodies xfce4-terminal librsvg2-common menu inetutils-tools dialog exo-utils dbus-x11 gtk2-engines-murrine gtk2-engines-pixbuf apt-transport-https neofetch fish
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
        echo "$user ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers 
    
         wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/candy-icons-master.tar.xz 
         wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/Sweet-Ambar-Blue-Dark-v40.tar.xz 
         wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/01-WhiteSur.tar.xz 
         wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/WhiteSur-Dark.tar.xz 
        wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/Sweet-cursors.tar.xz 
         wget https://raw.githubusercontent.com/Anon-404/My-assets/main/distro-x11/gnome/Sweet-Wallpapers.tar.xz
         wget https://raw.githubusercontent.com/Anon-404/My-assets/main/archlinux/com0613.jpg -O /usr/share/backgrounds/com0613.jpg
         wget https://raw.githubusercontent.com/Anon-404/My-assets/main/distro-x11/xfce4/config.tar.xz
         
        echo "clear" >> /home/$user/.bashrc
        echo "neofetch" >> /home/$user/.bashrc
        echo "fish" >> /home/$user/.bashrc
        
        
        echo "#! /bin/bash" >> $os
        echo "" >> $os
        echo "termux-x11 :1 &" >> $os
        echo "pd sh $os --user $user --shared-tmp " >> $os
        chmod 777 $os
        mv $os /data/data/com.termux/files/usr/bin
        chmod 777 /data/data/com.termux/files/usr/bin/$os
        
        echo "#! /bin/bash" >> x11-start
        echo "" >> x11-start
        echo "export DISPLAY=:1" >> x11-start
        echo "xfce4-session" >> x11-start
        chmod 777 x11-start
        mv xfce4-session /usr/bin
        chmod 777 /usr/bin/x11-start
        
        

         sudo rm -rf /home/$user/.config
         sudo tar -xvf Sweet-cursors.tar.xz -C "/usr/share/icons"
         tar -xvf Sweet-Wallpapers.tar.xz -C "/usr/share/backgrounds"
         sudo tar -xvf Sweet-Ambar-Blue-Dark-v40.tar.xz -C "/usr/share/themes/"
         sudo tar -xvf candy-icons-master.tar.xz -C "/usr/share/icons"
         sudo tar -xvf WhiteSur-Dark.tar.xz -C "/usr/share/themes"
         sudo tar -xvf 01-WhiteSur.tar.xz -C "/usr/share/icons"
         sudo tar -xvf config.tar.xz -C "/home/$user/" '
            
            

    elif { [[ "$os" == "deepin" ]] || [[ "$os" == "debian" ]] || [[ "$os" == "ubuntu" ]] || [[ "$os" == "openkylin" ]] || [[ "$os" == "pardus" ]]; } && [[ "$de" == "gnome" ]] ; then
    echo -e "\n${yellow}[+] ${green}Installing ${cyan}$de ${green}desktop environment on ${cyan}$os Linux ${white}"
    
    for i in gnupg2 curl nano git xz-utils at-spi2-core gnome gnome-shell gnome-terminal gnome-tweaks gnome-shell-extension-ubuntu-dock nautilus gedit librsvg2-common menu inetutils-tools dialog exo-utils dbus-x11 gtk2-engines-murrine gtk2-engines-pixbuf apt-transport-https neofetch fish
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
    echo "$user ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers 

    wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/candy-icons-master.tar.xz 
    wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/Sweet-Ambar-Blue-Dark-v40.tar.xz 
    wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/01-WhiteSur.tar.xz 
    wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/WhiteSur-Dark.tar.xz 
    wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/Sweet-cursors.tar.xz 
    wget https://raw.githubusercontent.com/Anon-404/My-assets/main/distro-x11/gnome/Sweet-Wallpapers.tar.xz
    wget https://raw.githubusercontent.com/Anon-404/My-assets/main/distro-x11/gnome/gnome-config.tar.xz
    
    echo "clear" >> /home/$user/.bashrc
    echo "neofetch" >> /home/$user/.bashrc
    echo "fish" >> /home/$user/.bashrc

    rm -rf /home/$user/.config
    mkdir /home/$user/.config
    
    
    echo "#! /bin/bash" >> $os
    echo "" >> $os
    echo "termux-x11 :1 &" >> $os
    echo "pd sh $os --user $user --shared-tmp " >> $os
    chmod 777 $os
    mv $os /data/data/com.termux/files/usr/bin
    chmod 777 /data/data/com.termux/files/usr/bin/$os
    
    
    echo "#! /bin/bash" >> x11-start
    echo "" >> x11-start
    echo "for file in $(find /usr -type f -iname "*login1*"); do rm -rf $file; done" >> x11-start
    echo "export DISPLAY=:1" >> x11-start
    echo "service dbus start" >> x11-start
    echo "gnome-shell --x11" >> x11-start
    
    
    tar -xvf Sweet-cursors.tar.xz -C "/usr/share/icons"
    tar -xvf Sweet-Wallpapers.tar.xz -C "/usr/share/backgrounds"
    tar -xvf Sweet-Ambar-Blue-Dark-v40.tar.xz -C "/usr/share/themes/"
    tar -xvf candy-icons-master.tar.xz -C "/usr/share/icons"
    tar -xvf WhiteSur-Dark.tar.xz -C "/usr/share/themes"
    tar -xvf 01-WhiteSur.tar.xz -C "/usr/share/icons"
    tar -xvf gnome-config.tar.xz -C "/home/$user/.config" '
        
    
    elif { [[ "$os" == "deepin" ]] || [[ "$os" == "ubuntu" ]] || [[ "$os" == "openkylin" ]] || [[ "$os" == "pardus" ]]; } && [[ "$de" == "fluxbox" ]] ; then
        echo -e "\n${yellow}[+] ${green}Installing ${cyan}$de ${green}desktop environment on ${cyan}$os Linux ${white}"
    
    elif { [[ "$os" == "deepin" ]] || [[ "$os" == "ubuntu" ]] || [[ "$os" == "openkylin" ]] || [[ "$os" == "pardus" ]]; } && [[ "$de" == "plasma" ]] ; then
        echo -e "\n${yellow}[+] ${green}Installing ${cyan}$de ${green}desktop environment on ${cyan}$os Linux ${white}"
    
    # Fedora
    
    elif [[ "$os" == "fedora" ]] && [[ "$de" == "xfce4" ]] ; then
        echo -e "\n${yellow}[+] ${green}Installing ${cyan}$de ${green}desktop environment on ${cyan}$os Linux ${white}"
        
        for i in gnupg2 curl nano git xz at-spi2-core xfce4-desktop xfce4-goodies xfce4-terminal librsvg2 menu inetutils dialog exo dbus-x11 gtk-murrine-engine gtk2-engines neofetch fish
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
        echo "$user ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers 
    
         wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/candy-icons-master.tar.xz 
         wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/Sweet-Ambar-Blue-Dark-v40.tar.xz 
         wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/01-WhiteSur.tar.xz 
         wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/WhiteSur-Dark.tar.xz 
        wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/Sweet-cursors.tar.xz 
         wget https://raw.githubusercontent.com/Anon-404/My-assets/main/distro-x11/gnome/Sweet-Wallpapers.tar.xz
         wget https://raw.githubusercontent.com/Anon-404/My-assets/main/archlinux/com0613.jpg -O /usr/share/backgrounds/com0613.jpg
         wget https://raw.githubusercontent.com/Anon-404/My-assets/main/distro-x11/xfce4/config.tar.xz
         
        echo "clear" >> /home/$user/.bashrc
        echo "neofetch" >> /home/$user/.bashrc
        echo "fish" >> /home/$user/.bashrc
        
        
        echo "#! /bin/bash" >> $os
        echo "" >> $os
        echo "termux-x11 :1 &" >> $os
        echo "pd sh $os --user $user --shared-tmp " >> $os
        chmod 777 $os
        mv $os /data/data/com.termux/files/usr/bin
        chmod 777 /data/data/com.termux/files/usr/bin/$os
        
        echo "#! /bin/bash" >> x11-start
        echo "" >> x11-start
        echo "export DISPLAY=:1" >> x11-start
        echo "xfce4-session" >> x11-start
        chmod 777 x11-start
        mv xfce4-session /usr/bin
        chmod 777 /usr/bin/x11-start
        
        

         sudo rm -rf /home/$user/.config
         sudo tar -xvf Sweet-cursors.tar.xz -C "/usr/share/icons"
         tar -xvf Sweet-Wallpapers.tar.xz -C "/usr/share/backgrounds"
         sudo tar -xvf Sweet-Ambar-Blue-Dark-v40.tar.xz -C "/usr/share/themes/"
         sudo tar -xvf candy-icons-master.tar.xz -C "/usr/share/icons"
         sudo tar -xvf WhiteSur-Dark.tar.xz -C "/usr/share/themes"
         sudo tar -xvf 01-WhiteSur.tar.xz -C "/usr/share/icons"
         sudo tar -xvf config.tar.xz -C "/home/$user/" '
        
    
    elif [[ "$os" == "fedora" ]] && [[ "$de" == "gnome" ]] ; then
    echo -e "\n${yellow}[+] ${green}Installing ${cyan}$de ${green}desktop environment on ${cyan}$os Linux ${white}"
    
    for i in gnupg2 curl nano git xz at-spi2-core gnome-shell gnome-terminal gnome-tweaks gnome-shell-extension-dash-to-dock nautilus gedit librsvg2 gtk-murrine-engine gtk2-engines dialog exo dbus-x11 inetutils neofetch fish
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
    echo "$user ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers 

    wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/candy-icons-master.tar.xz 
    wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/Sweet-Ambar-Blue-Dark-v40.tar.xz 
    wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/01-WhiteSur.tar.xz 
    wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/WhiteSur-Dark.tar.xz 
    wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/Sweet-cursors.tar.xz 
    wget https://raw.githubusercontent.com/Anon-404/My-assets/main/distro-x11/gnome/Sweet-Wallpapers.tar.xz
    wget https://raw.githubusercontent.com/Anon-404/My-assets/main/distro-x11/gnome/gnome-config.tar.xz
    
    echo "clear" >> /home/$user/.bashrc
    echo "neofetch" >> /home/$user/.bashrc
    echo "fish" >> /home/$user/.bashrc
    
    
    echo "#! /bin/bash" >> $os
    echo "" >> $os
    echo "termux-x11 :1 &" >> $os
    echo "pd sh $os --user $user --shared-tmp " >> $os
    chmod 777 $os
    mv $os /data/data/com.termux/files/usr/bin
    chmod 777 /data/data/com.termux/files/usr/bin/$os
    
    
    echo "#! /bin/bash" >> x11-start
    echo "" >> x11-start
    echo "for file in $(find /usr -type f -iname "*login1*"); do rm -rf $file; done" >> x11-start
    echo "export DISPLAY=:1" >> x11-start
    echo "service dbus start" >> x11-start
    echo "gnome-shell --x11" >> x11-start
    
    
    rm -rf /home/$user/.config
    mkdir /home/$user/.config
    
    tar -xvf Sweet-cursors.tar.xz -C "/usr/share/icons"
    tar -xvf Sweet-Wallpapers.tar.xz -C "/usr/share/backgrounds"
    tar -xvf Sweet-Ambar-Blue-Dark-v40.tar.xz -C "/usr/share/themes/"
    tar -xvf candy-icons-master.tar.xz -C "/usr/share/icons"
    tar -xvf WhiteSur-Dark.tar.xz -C "/usr/share/themes"
    tar -xvf 01-WhiteSur.tar.xz -C "/usr/share/icons"
    tar -xvf gnome-config.tar.xz -C "/home/$user/.config" '
        
        
    
    elif [[ "$os" == "fedora" ]] && [[ "$de" == "fluxbox" ]] ; then
        echo -e "\n${yellow}[+] ${green}Installing ${cyan}$de ${green}desktop environment on ${cyan}$os Linux ${white}"
    
    elif [[ "$os" == "fedora" ]] && [[ "$de" == "plasma" ]] ; then
        echo -e "\n${yellow}[+] ${green}Installing ${cyan}$de ${green}desktop environment on ${cyan}$os Linux ${white}"
    
    # OpenSUSE
    
    elif [[ "$os" == "opensuse" ]] && [[ "$de" == "xfce4" ]] ; then
        echo -e "\n${yellow}[+] ${green}Installing ${cyan}$de ${green}desktop environment on ${cyan}$os Linux ${white}"
        
        
        for i in gnupg2 curl nano git xz at-spi2-core xfce4 xfce4-panel xfce4-terminal librsvg menu inetutils dialog exo dbus-1-x11 gtk2-engine-murrine gtk2-engine-pixbuf neofetch fish
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
        echo "$user ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers 
    
         wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/candy-icons-master.tar.xz 
         wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/Sweet-Ambar-Blue-Dark-v40.tar.xz 
         wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/01-WhiteSur.tar.xz 
         wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/WhiteSur-Dark.tar.xz 
        wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/Sweet-cursors.tar.xz 
         wget https://raw.githubusercontent.com/Anon-404/My-assets/main/distro-x11/gnome/Sweet-Wallpapers.tar.xz
         wget https://raw.githubusercontent.com/Anon-404/My-assets/main/archlinux/com0613.jpg -O /usr/share/backgrounds/com0613.jpg
         wget https://raw.githubusercontent.com/Anon-404/My-assets/main/distro-x11/xfce4/config.tar.xz
         
        echo "clear" >> /home/$user/.bashrc
        echo "neofetch" >> /home/$user/.bashrc
        echo "fish" >> /home/$user/.bashrc
        
        
        echo "#! /bin/bash" >> $os
        echo "" >> $os
        echo "termux-x11 :1 &" >> $os
        echo "pd sh $os --user $user --shared-tmp " >> $os
        chmod 777 $os
        mv $os /data/data/com.termux/files/usr/bin
        chmod 777 /data/data/com.termux/files/usr/bin/$os
        
        echo "#! /bin/bash" >> x11-start
        echo "" >> x11-start
        echo "export DISPLAY=:1" >> x11-start
        echo "xfce4-session" >> x11-start
        chmod 777 x11-start
        mv xfce4-session /usr/bin
        chmod 777 /usr/bin/x11-start
        
        
         sudo rm -rf /home/$user/.config
         sudo tar -xvf Sweet-cursors.tar.xz -C "/usr/share/icons"
         tar -xvf Sweet-Wallpapers.tar.xz -C "/usr/share/backgrounds"
         sudo tar -xvf Sweet-Ambar-Blue-Dark-v40.tar.xz -C "/usr/share/themes/"
         sudo tar -xvf candy-icons-master.tar.xz -C "/usr/share/icons"
         sudo tar -xvf WhiteSur-Dark.tar.xz -C "/usr/share/themes"
         sudo tar -xvf 01-WhiteSur.tar.xz -C "/usr/share/icons"
         sudo tar -xvf config.tar.xz -C "/home/$user/" '
        
    
    elif [[ "$os" == "opensuse" ]] && [[ "$de" == "gnome" ]] ; then
    echo -e "\n${yellow}[+] ${green}Installing ${cyan}$de ${green}desktop environment on ${cyan}$os Linux ${white}"
    
    for i in gnupg2 curl nano git xz at-spi2-core gnome-shell gnome-terminal gnome-tweaks gnome-shell-extension-dash-to-dock nautilus gedit librsvg-2 gtk2-engine-murrine gtk2-engines dialog exo dbus-1 inetutils neofetch fish
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
    echo "$user ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers 

    wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/candy-icons-master.tar.xz 
    wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/Sweet-Ambar-Blue-Dark-v40.tar.xz 
    wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/01-WhiteSur.tar.xz 
    wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/WhiteSur-Dark.tar.xz 
    wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/Sweet-cursors.tar.xz 
    wget https://raw.githubusercontent.com/Anon-404/My-assets/main/distro-x11/gnome/Sweet-Wallpapers.tar.xz
    wget https://raw.githubusercontent.com/Anon-404/My-assets/main/distro-x11/gnome/gnome-config.tar.xz
    
    echo "clear" >> /home/$user/.bashrc
    echo "neofetch" >> /home/$user/.bashrc
    echo "fish" >> /home/$user/.bashrc
    
    
    echo "#! /bin/bash" >> $os
    echo "" >> $os
    echo "termux-x11 :1 &" >> $os
    echo "pd sh $os --user $user --shared-tmp " >> $os
    chmod 777 $os
    mv $os /data/data/com.termux/files/usr/bin
    chmod 777 /data/data/com.termux/files/usr/bin/$os
    
    
    echo "#! /bin/bash" >> x11-start
    echo "" >> x11-start
    echo "for file in $(find /usr -type f -iname "*login1*"); do rm -rf $file; done" >> x11-start
    echo "export DISPLAY=:1" >> x11-start
    echo "service dbus start" >> x11-start
    echo "gnome-shell --x11" >> x11-start
    
    
    rm -rf /home/$user/.config
    mkdir /home/$user/.config
    
    tar -xvf Sweet-cursors.tar.xz -C "/usr/share/icons"
    tar -xvf Sweet-Wallpapers.tar.xz -C "/usr/share/backgrounds"
    tar -xvf Sweet-Ambar-Blue-Dark-v40.tar.xz -C "/usr/share/themes/"
    tar -xvf candy-icons-master.tar.xz -C "/usr/share/icons"
    tar -xvf WhiteSur-Dark.tar.xz -C "/usr/share/themes"
    tar -xvf 01-WhiteSur.tar.xz -C "/usr/share/icons"
    tar -xvf gnome-config.tar.xz -C "/home/$user/.config" '
        
        
        
    
    elif [[ "$os" == "opensuse" ]] && [[ "$de" == "fluxbox" ]] ; then
        echo -e "\n${yellow}[+] ${green}Installing ${cyan}$de ${green}desktop environment on ${cyan}$os Linux ${white}"
    
    elif [[ "$os" == "opensuse" ]] && [[ "$de" == "plasma" ]] ; then
        echo -e "\n${yellow}[+] ${green}Installing ${cyan}$de ${green}desktop environment on ${cyan}$os Linux ${white}"
    
    # Void
    
    elif [[ "$os" == "void" ]] && [[ "$de" == "xfce4" ]] ; then
        echo -e "\n${yellow}[+] ${green}Installing ${cyan}$de ${green}desktop environment on ${cyan}$os Linux ${white}"
        
        
        for i in gnupg curl nano git xz at-spi2-core xfce4 xfce4-terminal librsvg menu inetutils dialog exo dbus gtk-engine-murrine gtk2-engines neofetch fish
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
        echo "$user ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers 
    
         wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/candy-icons-master.tar.xz 
         wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/Sweet-Ambar-Blue-Dark-v40.tar.xz 
         wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/01-WhiteSur.tar.xz 
         wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/WhiteSur-Dark.tar.xz 
        wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/Sweet-cursors.tar.xz 
         wget https://raw.githubusercontent.com/Anon-404/My-assets/main/distro-x11/gnome/Sweet-Wallpapers.tar.xz
         wget https://raw.githubusercontent.com/Anon-404/My-assets/main/archlinux/com0613.jpg -O /usr/share/backgrounds/com0613.jpg
         wget https://raw.githubusercontent.com/Anon-404/My-assets/main/distro-x11/xfce4/config.tar.xz
         
        echo "clear" >> /home/$user/.bashrc
        echo "neofetch" >> /home/$user/.bashrc
        echo "fish" >> /home/$user/.bashrc
        
        
        echo "#! /bin/bash" >> $os
        echo "" >> $os
        echo "termux-x11 :1 &" >> $os
        echo "pd sh $os --user $user --shared-tmp " >> $os
        chmod 777 $os
        mv $os /data/data/com.termux/files/usr/bin
        chmod 777 /data/data/com.termux/files/usr/bin/$os
        
        echo "#! /bin/bash" >> x11-start
        echo "" >> x11-start
        echo "export DISPLAY=:1" >> x11-start
        echo "xfce4-session" >> x11-start
        chmod 777 x11-start
        mv xfce4-session /usr/bin
        chmod 777 /usr/bin/x11-start
        
        
         sudo rm -rf /home/$user/.config
         sudo tar -xvf Sweet-cursors.tar.xz -C "/usr/share/icons"
         tar -xvf Sweet-Wallpapers.tar.xz -C "/usr/share/backgrounds"
         sudo tar -xvf Sweet-Ambar-Blue-Dark-v40.tar.xz -C "/usr/share/themes/"
         sudo tar -xvf candy-icons-master.tar.xz -C "/usr/share/icons"
         sudo tar -xvf WhiteSur-Dark.tar.xz -C "/usr/share/themes"
         sudo tar -xvf 01-WhiteSur.tar.xz -C "/usr/share/icons"
         sudo tar -xvf config.tar.xz -C "/home/$user/" '
    
    elif [[ "$os" == "void" ]] && [[ "$de" == "gnome" ]] ; then
    echo -e "\n${yellow}[+] ${green}Installing ${cyan}$de ${green}desktop environment on ${cyan}$os Linux ${white}"
    
    for i in gnupg curl nano git xz at-spi2-core gnome gnome-shell gnome-terminal gnome-tweaks gnome-shell-extension-dash-to-dock nautilus gedit librsvg gtk-engine-murrine gtk2-engines dialog exo dbus-1 inetutils neofetch fish
    do
        echo ""
        echo -e "${yellow}[+] ${green}Installing $i ${white}"
        echo ""
        while ! pd sh $os --shared-tmp -- /bin/bash -c "xbps-install -Sy $i"; do
            echo -e "${red}[-] Failed to install $i. Retrying...${white}"
            sleep 2
        done
        echo -e "${green}[+] Successfully installed $i ${white}"
    done

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
    echo "$user ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers 

    wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/candy-icons-master.tar.xz 
    wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/Sweet-Ambar-Blue-Dark-v40.tar.xz 
    wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/01-WhiteSur.tar.xz 
    wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/WhiteSur-Dark.tar.xz 
    wget https://raw.githubusercontent.com/Anon-404/My-assets/main/whitesure/Sweet-cursors.tar.xz 
    wget https://raw.githubusercontent.com/Anon-404/My-assets/main/distro-x11/gnome/Sweet-Wallpapers.tar.xz
    wget https://raw.githubusercontent.com/Anon-404/My-assets/main/distro-x11/gnome/gnome-config.tar.xz
    
    echo "clear" >> /home/$user/.bashrc
    echo "neofetch" >> /home/$user/.bashrc
    echo "fish" >> /home/$user/.bashrc
    
    
    echo "#! /bin/bash" >> $os
    echo "" >> $os
    echo "termux-x11 :1 &" >> $os
    echo "pd sh $os --user $user --shared-tmp " >> $os
    chmod 777 $os
    mv $os /data/data/com.termux/files/usr/bin
    chmod 777 /data/data/com.termux/files/usr/bin/$os
    
    
    echo "#! /bin/bash" >> x11-start
    echo "" >> x11-start
    echo "for file in $(find /usr -type f -iname "*login1*"); do rm -rf $file; done" >> x11-start
    echo "export DISPLAY=:1" >> x11-start
    echo "service dbus start" >> x11-start
    echo "gnome-shell --x11" >> x11-start
    
    
    rm -rf /home/$user/.config
    mkdir /home/$user/.config
    
    tar -xvf Sweet-cursors.tar.xz -C "/usr/share/icons"
    tar -xvf Sweet-Wallpapers.tar.xz -C "/usr/share/backgrounds"
    tar -xvf Sweet-Ambar-Blue-Dark-v40.tar.xz -C "/usr/share/themes/"
    tar -xvf candy-icons-master.tar.xz -C "/usr/share/icons"
    tar -xvf WhiteSur-Dark.tar.xz -C "/usr/share/themes"
    tar -xvf 01-WhiteSur.tar.xz -C "/usr/share/icons"
    tar -xvf gnome-config.tar.xz -C "/home/$user/.config" '
        
        
        
    elif [[ "$os" == "void" ]] && [[ "$de" == "fluxbox" ]] ; then
        echo -e "\n${yellow}[+] ${green}Installing ${cyan}$de ${green}desktop environment on ${cyan}$os Linux ${white}"
        
    elif [[ "$os" == "void" ]] && [[ "$de" == "plasma" ]] ; then
        echo -e "\n${yellow}[+] ${green}Installing ${cyan}$de ${green}desktop environment on ${cyan}$os Linux ${white}"
    
    else 
        echo -e "${red}[-] Unknown distro and desktop environment ${white}"
        exit 1
    fi
}

note(){
    banner
    echo -e "${yellow}[+] ${green}exit your termux"
    echo ""
    echo -e "${yellow}[+] ${green}open again and type ${cyan}$os${green} on termux"
    echo ""
    echo -e "${yellow}[+] ${green}install ${cyan}termux x11${green} app from github"
    echo ""
    echo -e "${yellow}[+] ${green}simply type ${cyan}x11-start ${green}to start desktop environment"
    echo ""
    echo -e "${yellow}[+] ${green}open ${cyan}termux x11 ${green}app and enjoy"
    echo ""
    echo -e "${yellow}[+] ${green}stop x11 service by ${cyan}CTRL + C"
    echo ""
}

main(){
    choise
    pkgInstall
    distroInstaller
    allowExternal # half
    Bpkgs
    desktopenv
    note
}

main
