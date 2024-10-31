printf "Por favor, insira sua senha de sudo e pressione enter: "
read senha_sudo
printf "Mudando para a pasta tmp\n"
cd /tmp/
printf "Baixando o Droidcam\n"
wget -O droidcam_latest.zip https://files.dev47apps.net/linux/droidcam_2.0.0.zip
printf "Baixado\nExtraindo...\n"
unzip droidcam_latest.zip -d droidcam
printf "Extraído\nEntrando na pasta droidcam\n"
cd droidcam
printf "Executando script de instalação"
echo $senha_sudo | sudo -S ./install-client && sudo ./install-video
printf "Instalado com sucesso\nRemovendo o módulo v4loopback\n"
sudo rmmod v4l2loopback_dc
printf "Removido\n"
printf "Recarregando módulo v4loopback\n"
sudo insmod /lib/modules/`uname -r`/kernel/drivers/media/video/v4l2loopback-dc.ko width=1280 height=720
printf "Pronto\nInstalado e configurado em 1280x720\n"