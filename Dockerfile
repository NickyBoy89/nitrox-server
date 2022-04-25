FROM ubuntu:latest

RUN apt-get -y update && apt-get -y upgrade

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y jq curl wget unzip mono-complete

# Get the latest version of Nitrox
RUN wget "$(curl https://api.github.com/repos/SubnauticaNitrox/Nitrox/releases | jq -r ".[0].assets[0].browser_download_url")"

RUN unzip *.zip

# Some mono configuration from:
# https://github.com/SubnauticaNitrox/Nitrox/issues/1785
RUN mkdir -p /root/.mono/registry/CurrentUser/
COPY values.xml /root/.mono/registry/CurrentUser/

# The port that the server runs on
EXPOSE 11000

CMD mono NitroxServer-Subnautica.exe
