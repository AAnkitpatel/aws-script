#!/bin/sh
# amazone-linux ami-03b5297d565ef30a6
#ubuntu  ami-0620d12a9cf777c87
#Red Hat Enterprise Linux 8 ami-0a74bfeb190bd404f
#SUSE Linux Enterprise Server ami-0e0e7b909aea48186
#echo "plz enter the os name like (ubuntu, amazone-linux, redhat)"
#sg=sg-0cc29a949b25af33d
key=ankitlinux2
echo plz enter the number:.
echo "1 = amazone-linux"
echo "2 = ubuntu"
echo "3 = redhat"
echo "plzz give the input(like 1, 2, 3)"
read opt
case $opt in 
#amazone-linux
1)
                echo "you are making amazone-linux"
                echo what is name you  want to ypu intstance:
                read tag
                echo how much you  want make instances plz enter the number:
                read no
                out=$(aws ec2 run-instances --image-id ami-03b5297d565ef30a6 --instance-type t2.micro --count $no --security-group-ids $sg --key-name $key --output text)
                id=$(echo $out | cut -d " " -f 9)
                aws ec2 create-tags --resources $id --tags "Key=Name,Value=$tag"
                echo your Instance Name is "$tag" And instanceId is "$id"              
                ;;
#ubuntu
2)
                echo "you are making Ubuntu"
                echo   what is name you  want to ypu intstance:
                read tag
                echo  how much you  want make instances plz enter the number:
                read no
                out=$(aws ec2 run-instances --image-id ami-0620d12a9cf777c87 --instance-type t2.micro --count $no --security-group-ids $sg --key-name $key --output text)
                id=$(echo $out | cut -d " " -f 9)
                aws ec2 create-tags --resources $id --tags "Key=Name,Value=$tag"
                echo your Instance Name is "$tag" And instanceId is "$id"              
                ;;
#redhat
3)
                echo "you are making Redhat"
                echo   what is name you  want to ypu intstance:
                read tag
                echo  how much you  want make instances plz enter the number:
                read no
                out=$(aws ec2 run-instances --image-id ami-0a74bfeb190bd404f --instance-type t2.micro --count $no --security-group-ids $sg --key-name $key --output text)
                id=$(echo $out | cut -d " " -f 9)
                aws ec2 create-tags --resources $id --tags "Key=Name,Value=$tag" 
                echo your Instance Name is "$tag" And instanceId is "$id"              
                ;;
*)
            echo "plz enter the os name like (amazone-linux, ubuntu, redhat) " ;;
esac                                                   
