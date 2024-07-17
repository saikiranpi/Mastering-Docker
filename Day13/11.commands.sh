sudo systemctl daemon-reload
sudo systemctl start alertmanager.service
sudo systemctl enable alertmanager.service
sudo systemctl status alertmanager.service --no-pager



sudo systemctl restart alertmanager.service
sudo systemctl status alertmanager.service --no-pager


sudo systemctl restart prometheus 
sudo /bin/systemctl restart grafana-server
sudo systemctl restart alertmanager.service
curl -s -XPOST localhost:9090/-/reload


