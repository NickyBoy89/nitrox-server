FROM archlinux:latest

# All multilib support to download a few more packages
RUN echo "[multilib]" | tee -a /etc/pacman.conf
RUN echo "Include = /etc/pacman.d/mirrorlist" | tee -a /etc/pacman.conf

# Update everything
RUN pacman -Syu --noconfirm --needed wine wine-mono

RUN pacman -S --noconfirm --needed jq wget unzip git base-devel

RUN useradd -r -s /usr/bin/nologin temp

RUN git clone https://aur.archlinux.org/proton.git

RUN chown -R temp proton && cd proton && su temp -c "makepkg -s" && pacman -U proton

RUN wget "$(curl https://api.github.com/repos/SubnauticaNitrox/Nitrox/releases | jq -r ".[0].assets[0].browser_download_url")"

RUN unzip *.zip

CMD wine NitroxServer-Subnautica.exe
