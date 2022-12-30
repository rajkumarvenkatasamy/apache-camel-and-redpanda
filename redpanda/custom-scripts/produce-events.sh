#!/bin/bash

TOPIC=user-login

# Create Redpanda topic
rpk topic create $TOPIC

rpk topic create $TOPIC-DLT

# Counter for the USER_ID
USER_ID=1

# Infinite loop to produce data
while true ; do
    echo $USER_ID
    
    JSON_STRING="{"\"user_id"\": $USER_ID, "\"user_name"\": "\"user_$USER_ID"\"}"
    # Send the message
    echo ${JSON_STRING} | rpk topic produce $TOPIC

    sleep 8
    # Increment the USER_ID
    USER_ID=$(($USER_ID+1))
done