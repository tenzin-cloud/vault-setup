#!/bin/bash

set -x
set -e

## install os packages
apt-get update
apt-get install -y git python3-venv unzip

## setup python venv
if [[ ! -d ~/.venv ]]
then
  mkdir ~/.venv
  python3 -m venv ~/.venv
fi

source ~/.venv/bin/activate
pip install ansible

## pull my tools setup repo
git clone https://github.com/tlhakhan/tools.git

## install docker
cd tools
./docker.yaml

## add ubuntu user to the docker group
usermod -aG docker ubuntu

## change ubuntu user's shell to bash
chsh --shell /usr/bin/bash ubuntu
