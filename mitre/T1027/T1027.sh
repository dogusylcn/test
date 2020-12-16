echo "ZWNobyAiTWFsd2F0aW9uIHdhcyBoZXJlIg==" > /tmp/encoded.dat
cat /tmp/encoded.dat | base64 -d > /tmp/art.sh
chmod +x /tmp/art.sh
/tmp/art.sh