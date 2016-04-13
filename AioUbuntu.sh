#!/bin/bash
clear
echo AIO Ubuntu y derivados 1.0.
echo Versión del 12/04/2016.
echo Script creado por En pocos pasos.
echo Visita mi web http://www.epocospasos.wordpress.com
echo Proyecto Github https://github.com/enpocospasos/AIOUbuntu
echo Este script está creado sin fines de lucro, los software instalados pertenecen a sus respectivos fabricantes.
echo AVISO: Algunos repositorios pueden cambiar con el tiempo.
echo Aunque esta testeado (en Ubuntu 15.10 y 14.04), optimizado y corroborado todo de que es funcional, no se ha testeado en todas
echo las distribuciones, ni en todos los ordenadores. Por lo que la ejecucion del script corre a cuenta del usuario que lo inicialice.
echo No me responsabilizo de posibles alteraciones del scirpt, o daños causados por agentes externos o por el mismo codigo (remarco el que no ha sido testeado en todas las distribuciones).
echo Por favor, si ha encontrado algun error o problema, notifiquelo al correo: enpocospasos@gmail.com.
echo para arreglarlo en futuras versiones
#Copiando sources.list por si acaso
echo Copiando sources.list original por si acaso
sudo cp /etc/apt/sources.list /etc/apt/sources.list.cp
#Obteniendo claves para los repositorios
echo Obteniendo claves para los repositorios
wget -q -O- http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -
wget -q -O - http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc | sudo apt-key add -
sudo apt-key add - < Release.key 
sudo rm -
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59
sudo rm linux_signing_key.pub 
sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 0xd66b746e
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B05498B7
sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com C1289A29
sudo gpg --keyserver hkp://subkeys.pgp.net --recv-keys "047F765CAC33218C"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
sudo gpg --export --armor "047F765CAC33218C" | sudo apt-key add -
#Obteniendo repositorios
echo Obteniendo Repositorios
sudo echo "deb http://archive.canonical.com/ubuntu $(lsb_release -s -c) partner" \ | sudo tee -a /etc/apt/sources.list > /dev/null
sudo echo "deb http://archive.getdeb.net/ubuntu vivid-getdeb apps" \ | sudo tee -a /etc/apt/sources.list > /dev/null
sudo echo "deb http://archive.getdeb.net/ubuntu vivid-getdeb games" \ | sudo tee -a /etc/apt/sources.list > /dev/null
sudo echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -s -c) contrib" \ | sudo tee -a /etc/apt/sources.list > /dev/null
sudo echo "deb http://repository.spotify.com stable non-free" \ | sudo tee -a /etc/apt/sources.list > /dev/null
#Repositorio de Java
sudo add-apt-repository -y ppa:webupd8team/java
#Repositorio de Noobslabs temas
sudo add-apt-repository -y ppa:noobslab/themes
#Repositorio de Brackets
sudo add-apt-repository -y ppa:webupd8team/brackets
#Repositorio de GrubCustomizer
sudo add-apt-repository ppa:danielrichter2007/grub-customizer -y
#Repositorio de Sublime Text 3
sudo add-apt-repository ppa:webupd8team/sublime-text-3 -y
#Repositorio de Openshot
sudo add-apt-repository -y ppa:openshot.developers/ppa
#Repositorio de Drivers gráficos más actualizados que los oficiales
sudo add-apt-repository -y ppa:graphics-drivers/ppa
#Repositorio de cliente de Google drive Oclam-fuse
sudo add-apt-repository -y ppa:alessandro-strada/ppa
#actualizando cache de repositorios
echo actualizando repositorios
sudo apt-get update --yes --quiet
#actaulizando sistema
echo actaulizando sistema
sudo apt-get -q -y upgrade
sudo apt-get install -f
#A no ser que tengas un servidor de ubuntu, landscape te es inútil
echo Quitando Landscape
sudo apt-get remove  --yes --quiet landscape-client-ui-install
#Deja-dup lo desinstalo porque suelo usar 2º disco duro puedes borrar esta línea si lo usas.
echo Quitando Deja-dup
sudo apt-get remove  --yes --quiet deja-dup
#Transmission me parece bastante menos avanzado que qbitorrent así que fuera.
echo Quitando Transmission
sudo apt-get remove  --yes --quiet transmission-gtk
#Instalando todos los programas
echo Instalando todos los programas
sudo apt-get -q -y install ubuntu-restricted-extras rar unace p7zip-full p7zip-rar sharutils mpack synaptic aptitude gdebi dconf-tools qbittorrent rhythmbox python-libproxy python-pylast python-pip libreoffice wine gimp-data gimp-data-extras gimp-help-es gimp-lensfun gimp-plugin-registry amule fontypython preload g++ bum myspell-es gimp gimp-data-extras gimp-help-es gimp-plugin-registry gimp-gmic gimp-gutenprint gimp-dcraw cheese skype oracle-java9-installer firefox-locale-es thunderbird-locale-es thunderbird-locale-es-es libreoffice-l10n-es language-pack-es language-pack-en-base blender audacity vlc libdvdread4 gnome-system-tools linux-generic linux-headers-generic linux-image-generic hfsplus hfsutils hfsprogs ntfs-config curl wget lshw sublime-text-installer grive brackets spotify-client inkscape filezilla nautilus-dropbox nautilus-admin mysql-workbench google-drive-ocamlfuse git virtualbox-5.0

#Instalando Google Chrome
echo ATENCION Google chrome puede no instalarse, en caso de fallo visitar web oficial
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

#Instalando Teamviewer
wget http://download.teamviewer.com/download/teamviewer_i386.deb
sudo dpkg -i teamviewer_i386.deb

#Instalando VkAudiosaver (descargador de música gratuito y open source)
wget http://vkaudiosaver.ru/downloads/vkaudiosaver-debian-amd64.deb
sudo dpkg -i vkaudiosaver-debian-amd64.deb


#Spotify add killer, un bloqueador de publicidad
wget http://vkaudiosaver.ru/downloads/vkaudiosaver-debian-amd64
sudo dpkg -i vkaudiosaver-debian-amd64


# Optimizando sistema de reproducción de DVD
echo arreglando algunas cosas...
sudo /usr/share/doc/libdvdread4/install-css.sh

#Quitando ficheros temporales de la instalación
#script anti publi
echo instalando antipublicidad
sudo rm /usr/local/bin/hosty 
sudo wget -c https://github.com/juankfree/hosty/raw/master/hosty -O /usr/local/bin/hosty
sudo chmod +x /usr/local/bin/hosty 
hosty
#Deshabilitando usuario invitado
echo Deshabilitando usuario invitado
echo allow-guest=false | sudo tee -a /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf
echo PONER EL DEFAULT=0 PARA QUITAR UN MOLESTO MENSAJE DE ERROR QUE SALE A VECES EN EL INICIO DE UBUNTU
sudo nano /etc/default/apport
#Quitando todo lo temporal
sudo rm ./vivaldi-stable_1.0.435.42-1_amd64.deb
sudo rm ./vkaudiosaver-debian-amd64
sudo rm ./teamviewer_i386.deb
sudo rm ./google-chrome-stable_current_amd64.deb
sudo rm ./vkaudiosaver-debian-amd64.deb
sudo apt-get -y autoremove 
sudo apt-get -y autoclean 
sudo apt-get -y clean
sudo cd /tmp
sudo rm -r *
#Para habilitar el ctrl + alt + backspace
echo Dale todo a Siguiente y en el último paso indicar activar ctrl + alt + backspace
sudo dpkg-reconfigure keyboard-configuration
#Añadiendo el usuario al grupo de virtualbox para poder usar los USBs
sudo addgroup $USER vboxusers
exit
