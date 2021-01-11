#!/usr/bin/env bash
yum install net-tools -y -q 2>&1
eth="eth0" 
main_ip=$(ifconfig ${eth} | awk -F "[^0-9.]+" 'NR==2{print $2}')

iptables -t nat -F
iptables -t nat -A POSTROUTING -o ${eth} -j SNAT --to-source ${main_ip}
user_ip_head="10.0.1."
	for (( d = 100; d <= 200; d++ ));do
		     user_ip=${user_ip_head}${d}
			ssh_port=${d}"00"
			user_port_first=${d}"01"
			user_port_last=${d}"99"
		iptables -t nat -A PREROUTING -i ${eth} -p tcp -m tcp --dport ${ssh_port} -j DNAT --to-destination ${user_ip}:22
		iptables -t nat -A PREROUTING -i ${eth} -p tcp -m tcp --dport ${user_port_first}:${user_port_last} -j DNAT --to-destination ${user_ip}
		iptables -t nat -A PREROUTING -i ${eth} -p udp -m udp --dport ${user_port_first}:${user_port_last} -j DNAT --to-destination ${user_ip}	
	done
service iptables save
service iptables restart
