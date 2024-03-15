# Odoo Crash course
This repository comprises of everything I taught myself about odoo15 and all the different custom modules I made during the learning process. It is so clear and concise.I give so much credits to odoo mates, without them I couldn't have this solid understanding of how odoo works and what it entails.
<hr>

## What is Odoo?
Odoo is a comprehensive suite of business applications including Sales, CRM, Project Management, Warehouse Management, Manufacturing, Financial Management, Human Resources, and more. It's built on a modular architecture, allowing you to start with a few modules and add more as your business needs grow.
<br>
# Installation
## 1.Install Dependecies

```
sudo apt update
sudo apt install git python3-pip build-essential wget python3-dev python3-venv \
    python3-wheel libfreetype6-dev libxml2-dev libzip-dev libldap2-dev libsasl2-dev \
    python3-setuptools node-less libjpeg-dev zlib1g-dev libpq-dev \
    libxslt1-dev libldap2-dev libtiff5-dev libjpeg8-dev libopenjp2-7-dev \
    liblcms2-dev libwebp-dev libharfbuzz-dev libfribidi-dev libxcb1-dev
```

## 2.Creating System user

```
sudo useradd -m -d /opt/odoo15 -U -r -s /bin/bash odoo15
```
## 3.Installing postgres 16
- During postgresql installation in ubuntu I used the guideline below from dev-community and I installed it without facing any errors

https://dev.to/rainbowhat/postgresql-16-installation-on-ubuntu-2204-51ia

## 4.Installing wkhtmltopdf

```
sudo wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.bionic_amd64.deb
```
Once the file is downloaded install it

```
sudo apt install ./wkhtmltox_0.12.5-1.bionic_amd64.deb
```
## 5.Installing and Configuring Odoo 15 
- Create odoo15 user
```
sudo su - odoo15
```
- After installing odoo15 user clone the odoo source code
```
git clone https://www.github.com/odoo/odoo --depth 1 --branch 15.0 /opt/odoo15/odoo
```
- Create a virtual environment for odoo
```
cd /opt/odoo15
python3 -m venv odoo-venv
```
- Activate the virtual environment
```
source odoo-venv/bin/activate
```
- Odoo dependencies are specified in the requirements.txt file. Install all required Python modules with pip3
```
pip3 install wheel
pip3 install -r odoo/requirements.txt
```
- Once done, deactivate the environment
```
deactivate
```
- Create custom-addons folder for 3rd party modules
```
mkdir /opt/odoo15/odoo-custom-addons
```
- switch back to super user
```
exit
```
- create configuration file for the odoo-server
```
sudo nano /etc/odoo15.conf
```
It should look something like this
```
[options]
; This is the password that allows database operations:
admin_passwd = my_admin_passwd
db_host = False
db_port = False
db_user = odoo15
db_password = False
addons_path = /opt/odoo15/odoo/addons,/opt/odoo15/odoo-custom-addons
```
Note: replace `my_admin_passwd` with your password

## 6.Creating Systemd Unit File
A unit file is a configuration ini-style file that holds information about a service.

```
sudo nano /etc/systemd/system/odoo15.service
```
it should look like this
```
[Unit]
Description=Odoo15
Requires=postgresql.service
After=network.target postgresql.service

[Service]
Type=simple
SyslogIdentifier=odoo15
PermissionsStartOnly=true
User=odoo15
Group=odoo15
ExecStart=/opt/odoo15/odoo-venv/bin/python3 /opt/odoo15/odoo/odoo-bin -c /etc/odoo15.conf
StandardOutput=journal+console

[Install]
WantedBy=multi-user.target
```
- Notify systemd that a new unit file exists:
```
sudo systemctl daemon-reload
```
- Start the Odoo service and enable it to start on boot by running
```
sudo systemctl enable --now odoo15
```
- Verify that the service is up and running
```
sudo systemctl status odoo15
```
- You can check the messages logged by the Odoo service using the command below
```
sudo journalctl -u odoo15

```
## Conclusion
Following the installation step by step you'll not encounter any errors everything will work just fine as intended

## Author
Samuel Senerwa





















