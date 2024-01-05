rm -rf ngrok ngrok.zip ngrok.sh > /dev/null 2>&1
wget -O ng.sh https://raw.githubusercontent.com/0x-raafet/openbullet_setup/main/ng.sh > /dev/null 2>&1
chmod +x ng.sh
./ng.sh
clear
echo "===================================="
echo "Installing Dotnet ..."
wget https://download.visualstudio.microsoft.com/download/pr/1cac4d08-3025-4c00-972d-5c7ea446d1d7/a83bc5cbedf8b90495802ccfedaeb2e6/dotnet-sdk-6.0.417-linux-x64.tar.gz > /dev/null 2>&1
mkdir -p $HOME/dotnet && tar zxf dotnet-sdk-6.0.417-linux-x64.tar.gz -C $HOME/dotnet > /dev/null 2>&1
export DOTNET_ROOT=$HOME/dotnet
export PATH=$PATH:$HOME/dotnet
git clone https://github.com/openbullet/OpenBullet2/  > /dev/null 2>&1
cd OpenBullet2/OpenBullet2
dotnet publish --configuration Release  > /dev/null 2>&1
cd bin/Release/net6.0/publish
nohup dotnet ./OpenBullet2.dll &>/dev/null &
apt install screen -y > /dev/null 2>&1
cd
echo "Now Execute this commands :"
echo "screen"
echo " ./ngrok http 5000"
echo "detach 'ctrl A+D'"
