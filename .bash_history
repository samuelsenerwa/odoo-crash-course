git clone https://www.github.com/odoo/odoo --depth 1 --branch 15.0 /opt/odoo15/odoo
git config --global http.postBuffer 524288000
git clone git@github.com:odoo/odoo.git --depth 1 --branch 15.0 /opt/odoo15/odoo
cd ~/.ssh
ssh-keygen -o -t rsa -C "samuelsenerwa@gmail.com"
ls
cd /opt/odoo15/
ls
cat git.pub 
git clone git@github.com:odoo/odoo.git --depth 1 --branch 15.0 /opt/odoo15/odoo
git clone https://www.github.com/odoo/odoo --depth 1 --branch 15.0 /opt/odoo15/odoo
ls
git config --global core.compression 0
git clone https://www.github.com/odoo/odoo --depth 1 --branch 15.0 /opt/odoo15/odoo
git config --global core.compression 9
git clone https://www.github.com/odoo/odoo --depth 1 --branch 15.0 /opt/odoo15/odoo
ls
cd odoo/
ls
cd ..
ls
cd /opt/odoo15
python3 -m venv odoo-venv
source odoo-venv/bin/activate
pip3 install wheel
ls
pip3 install -r odoo/requirements.txt
deactivate
mkdir /opt/odoo15/odoo-custom-addons
ls
exit
