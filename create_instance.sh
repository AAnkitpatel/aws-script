#!/bin/sh
sub='subnet-49437821'
sec='sg-0967b41d4e2343e31'
ami='ami-0a4a70bd98c6d6441'
keyp='MyKeyPair'
echo  intstance Name:
read tag
echo  instance count:
read no
id=$(aws ec2 run-instances --image-id $ami --instance-type t2.micro --count 1 --security-group-ids $sec --key-name $keyp   --output table | grep InstanceId | cut -d "|" -f4)
aws ec2 create-tags --resources $id --tags "Key=Name,Value=$tag"
ip=$(aws ec2 describe-instances --instance-ids i-06ea152ed5b4513c3 --output json | grep -e PublicIpAddress -e InstanceId)
echo your Instance detail"
$tag,$ip"

