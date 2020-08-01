#!/bin/sh
echo  intstance Name:
read tag
echo  instance count:
read no
out=$(aws ec2 run-instances --image-id ami-0620d12a9cf777c87 --instance-type t2.micro --count $no --security-group-ids sg-0622e82b35f4a191c --key-name ankitlinux1 --user-data file://basic.sh  --output text)
id=$(echo $out | cut -d " " -f 9)
aws ec2 create-tags --resources $id --tags "Key=Name,Value=$tag"
echo your Instance Name is "$tag" And instanceId is "$id"
#aws ec2 run-instances --image-id ami-0620d12a9cf777c87 --count 1 --instance-type t2.micro --key-name ankitlinux1 --security-group-ids sg-0622e82b35f4a191c --user-data file://basic.sh
