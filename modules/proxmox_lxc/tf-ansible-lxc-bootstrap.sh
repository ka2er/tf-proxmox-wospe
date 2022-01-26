#!/bin/sh

OLD_IFS=$IFS
IFS=/ read host virt id <<< "$1"
IFS=$OLD_IFS

playbook=$2
user=$3

#modules/proxmox_lxc/tf-ansible-lxc-bootstrap.sh pve4/lxc/128 graylog.yml
echo "Boostrapping LXC #$id with playbook $2"

# let lxc start happen and ip be provisionned
sleep 10

# xargs strip spaces
IP=`ssh $host lxc-info $id | grep IP | cut -d: -f2 | xargs`

echo "Guessing IP...$IP"

[[ -z $IP ]] && exit 1


##TODO user centos|ubu|root

echo $IP > $virt-$id.inventory

# retrieve role
ansible-galaxy install graylog2.graylog

# update package nodes
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i -i $virt-$id.inventory -u $user update.yml
#ANSIBLE_HOST_KEY_CHECKING=False ansible all -i $user@$IP, -m ansible.builtin.package -a "update_cache=true"

# deploy
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i $virt-$id.inventory -u $user $playbook