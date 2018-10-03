#!/bin/bash
timestamp()
{
 date +"%Y-%m-%d %T"
}


a=$(/bin/netstat -tulpn | awk '{print $7}' |  grep polkadot | wc -l )
if test $a = "0"
then
 echo "$(timestamp): Polkadot Validator Down" >> /var/log/polkamonitor.log
 /root/.cargo/bin/polkadot --name clb-polkadancer --validator --key 0x4aaebdf09db9eea9b3b0b14656db734d83ebbabe4e7fb2fb019f71a81de137f0 &>> /var/log/polkamonitor.log
fi

# Every Minute a check, add the following cron-job
# * * * * *   /root/polkamonitor.sh  > /dev/null 2>&1
# crontab -e
# grep cron /var/log/syslog

# https://tutorialinux.com/securing-ssh-with-sshguard/
# https://andschwa.com/post/configuring-sshguard-on-ubuntu-server/
#  service sshguard restart
# iptables -nvL sshguard


# sudo apt-get install sshguard
# iptables -N sshguard
# ip6tables -N sshguard
# iptables -A INPUT -j sshguard
# ip6tables -A INPUT -j sshguard
# service sshguard restart