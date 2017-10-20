#!/bin/bash

instanceIn = 'aws ec2 describe-instance-status --instance-id $1 | wc -l'

if [ "$1" 1 ]; then #problem here <-
	echo "Wrong parameter passed"
else
	if [ $instanceIn -eq 3 ]; then
		echo "Instance exists but isn't available"
	elif aws ec2 describe-instance-status --instance-id $1; then
		echo "Instance is running"
	else
		echo "Instance doesn't exists"
	fi
fi
