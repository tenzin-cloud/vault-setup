# README
A repository for Vault setup in my home lab. A modest [Raspberry Pi 3](https://www.raspberrypi.com/products/raspberry-pi-3-model-b-plus/) serves as the host for my home lab Vault instance.  It runs on my home wifi network somehwere (easily portable).  It is accessible without much fuss at <https://vault.tenzin.cloud>.

## Bootstrap setup
- Get the initial Raspberry Pi OS Lite system prepped for Docker and for Terraform automation.

```bash
## install os packages
sudo apt-get update
sudo apt-get install -y git python3-venv

## setup python venv
if [[ ! -d ~/.venv ]]
then
  mkdir ~/.venv
  python3 -m venv ~/.venv
fi

source ~/.venv/bin/activate
echo 'source ~/.venv/bin/activate' >> ~/.bashrc
pip install ansible

## pull my tools setup repo
git clone https://github.com/tlhakhan/tools.git

## install docker
cd tools
./docker.yaml

## add pi user to the docker group
sudo usermod -aG docker pi
```
