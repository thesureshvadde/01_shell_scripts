#!/bin/bash

AMI=ami-0f3c7d07486cad139 #Replace the ami id
SG_ID=sg-068f4d593bbb78b34
INSTANCES=("mongodb" "redis" "mysql" "rabbitmq" "catalogue" "user" "cart" "shipping" "payment" "dispatch" "web")
ZONE_ID=Z08634832J9AMNTG9D2CW #Replace with you zoneID
DOMAIN_NAME=haripalepu.cloud

for i in "${INSTANCES[@]}"
do 
  echo "instance is: $i"
  if [ $i == "mongodb" ] || [ $i == "mysql" ] || [ $i == "shipping" ]
  then 
      INSTANCE_TYPE="t3.small"
  else
      INSTANCE_TYPE="t2.micro"
  fi

IP_ADDRESS=$(aws ec2 run-instances --image-id ami-0f3c7d07486cad139 --count 1 --instance-type $INSTANCE_TYPE --security-group-ids sg-068f4d593bbb78b34 --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$i}]" --query 'Instances[0].PrivateIpAddress' --output text)
echo "$i: $IP_ADDRESS"    #Replace the ami id

#create R53 record, make sure you delete existing record
    aws route53 change-resource-record-sets \
    --hosted-zone-id $ZONE_ID \
    --change-batch '
    {
        "Comment": "Creating a record set for cognito endpoint"
        ,"Changes": [{
        "Action"              : "UPSERT"
        ,"ResourceRecordSet"  : {
            "Name"              : "'$i'.'$DOMAIN_NAME'"
            ,"Type"             : "A"
            ,"TTL"              : 1
            ,"ResourceRecords"  : [{
                "Value"         : "'$IP_ADDRESS'"
            }]
        }
        }]
    }
        '

done