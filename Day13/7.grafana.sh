sudo apt update
sudo apt-get install -y gnupg2 curl software-properties-common
curl https://packages.grafana.com/gpg.key | sudo apt-key add -
sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"
sudo apt update


# #You might get public key error when you perform above command. We can resolve this by running below comamnd with the key given in the error

# sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 8C8C34C524098CB6

sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"

sudo apt-get update

sudo apt-get -y install grafana

sudo systemctl enable --now grafana-server

sudo /bin/systemctl start grafana-server

sudo /bin/systemctl status grafana-server --no-pager

##################### CUSTOM DASHBOARD###################
https://grafana.com/grafana/dashboards/10180

