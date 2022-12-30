#!/bin/bash

TOPIC=user-login

# Create Redpanda topic
rpk topic create $TOPIC

# Counter for the user_id
USER_ID=1

# Infinite loop to produce data
while true ; do
    JSON_STRING=$( jq -n --arg user_id "$USER_ID" --arg user_name "$USER_ID" '{user_id: $user_id, user_name: $user_name}' );
    # Send the message
    echo ${JSON_STRING} ; done | rpk topic produce $TOPIC

    # Increment the id
    USER_ID=$((user_id+1))
done