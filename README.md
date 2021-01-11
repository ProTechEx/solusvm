# solusvm

wget https://raw.githubusercontent.com/hulisang/solusvm/main/solusvm.sh && chmod +x solusvm.sh && bash solusvm.sh

wget https://raw.githubusercontent.com/hulisang/solusvm/main/addnat100.sh && chmod +x solusvm.sh && bash solusvm.sh

wget https://raw.githubusercontent.com/hulisang/solusvm/main/addswap.sh && chmod +x addswap.sh && bash addswap.sh 512


wget https://raw.githubusercontent.com/hulisang/solusvm/main/addswap.sh && chmod +x addswap.sh && sed -i "2i/root/addswap.sh 512" /etc/rc.local && chmod +x /etc/rc.local
