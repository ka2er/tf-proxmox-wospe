#!/bin/sh

OLD_IFS=$IFS
IFS=/ read host virt id <<< "$1"
IFS=$OLD_IFS

playbook=$2
user=$3
host=$4

#modules/proxmox_lxc/tf-ansible-lxc-bootstrap.sh pve4/lxc/128 graylog.yml
echo "Boostrapping LXC #$id on host $host with playbook $playbook"

# let lxc start happen and ip be provisionned
sleep 10

# xargs strip spaces
IP=`ssh $host lxc-info $id | grep IP | cut -d: -f2 | xargs`

echo "Guessing IP...$IP"

[[ -z $IP ]] && exit 1


##TODO user centos|ubu|root

cat <<EO_INVENTORY > $virt-$id.inventory
[lxc]
$IP ansible_user=$user

[host]
$host ansible_user=root
EO_INVENTORY

# retrieve role
ansible-galaxy install graylog2.graylog

# update package nodes
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i $virt-$id.inventory -u $user update.yml
#ANSIBLE_HOST_KEY_CHECKING=False ansible all -i $user@$IP, -m ansible.builtin.package -a "update_cache=true"

# deploy
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i $virt-$id.inventory -l lxc -u $user $playbook.yml --extra-vars lxc_id=$id
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i $virt-$id.inventory -l host -u $user $playbook-host.yml --extra-vars lxc_id=$id