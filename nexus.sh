yum install java-21-amazon-corretto -y
cd /opt
wget https://download.sonatype.com/nexus/3/nexus-3.96.0-09-linux-x86_64.tar.gz
tar -zxvf nexus-3.96.0-09-linux-x86_64.tar.gz
useradd nexus
chown -R nexus:nexus nexus-3.96.0-09 sonatype-work

Starting Nexus Service
*** We have switch into nexus user and start,restart or stop service and switch to the nexus path also ***

su - nexus
cd /opt/nexus-3.96.0-09/bin/
./nexus start


[Service]
Type=forking
LimitNOFILE=65536
User=nexus
Group=nexus
ExecStart=/app/nexus/bin/nexus start
ExecStop=/app/nexus/bin/nexus stop
User=nexus
Restart=on-abort

[Install]
WantedBy=multi-user.target
EOL
sudo chkconfig nexus on
sudo systemctl start nexus
sudo systemctl enable nexus
sudo systemctl status nexus
