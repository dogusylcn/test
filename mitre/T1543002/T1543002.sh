echo "[Unit]" > /etc/systemd/system/art-systemd-service.service
echo "Description=Atomic Red Team Systemd Service" >> /etc/systemd/system/art-systemd-service.service
echo "" >> /etc/systemd/system/art-systemd-service.service
echo "[Service]" >> /etc/systemd/system/art-systemd-service.service
echo "Type=simple"
echo "ExecStart=/bin/touch /tmp/art-systemd-execstart-marker" >> /etc/systemd/system/art-systemd-service.service
echo "ExecStartPre=/bin/touch /tmp/art-systemd-execstartpre-marker" >> /etc/systemd/system/art-systemd-service.service
echo "ExecStartPost=/bin/touch /tmp/art-systemd-execstoppost-marker" >> /etc/systemd/system/art-systemd-service.service
echo "ExecReload=/bin/touch /tmp/art-systemd-execreload-marker" >> /etc/systemd/system/art-systemd-service.service
echo "ExecStop=/bin/touch /tmp/art-systemd-execstop-marker" >> /etc/systemd/system/art-systemd-service.service
echo "ExecStopPost=/bin/touch /tmp/art-systemd-execstartpost-marker" >> /etc/systemd/system/art-systemd-service.service
echo "" >> /etc/systemd/system/art-systemd-service.service
echo "[Install]" >> /etc/systemd/system/art-systemd-service.service
echo "WantedBy=default.target" >> /etc/systemd/system/art-systemd-service.service
systemctl daemon-reload
systemctl enable art-systemd-service.service
systemctl start art-systemd-service.service