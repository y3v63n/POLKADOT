# README

This is a Polkadot Validator Node Docker Image base on Ubuntu 16.04 (Jelastic PaaS ready)

## Docker Build Commands

 * docker build -t=talfco/clb-polkadot:v0.2 .
 * docker run --rm -it talfco/clb-polkadot:v0.2 polkadot
 * docker push talfco/clb-polkadot:v0.2
 
 
 
## Miscellaneous 
* Polkadot DB Location: `/.local/share/Polkadot/chains#` will be mapped to the `/data`
 
 
## Network stuff

    # checking dropped hosts 
    iptables -nvL sshguard
    
    # get all network devices
    ip a
    # 
    tcpdump -nvvv -i any -c 100 -s 100 -w dump.out 
    tcpdump -nvvv -i venet0 -c 100 -s 100 -w dump.out 
    
    tcpdump -w dump.out -i venet0 -c 10  -vvv
     
    # checking strength of ssh keys
    for key in ~/.ssh/id_*; do ssh-keygen -l -f "${key}"; done | uniq
    
