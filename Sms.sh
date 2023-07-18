#!/bin/bash

# Prompt the user for message details
read -p "Enter the phone number of the recipient: " phone_number
read -p "Enter the message content: " message
read -p "Enter the date and time to send the message (YYYY-MM-DD HH:MM): " schedule_datetime

# Format the date and time for scheduling
schedule_unixtime=$(date -d "$schedule_datetime" +%s)

# Schedule the SMS using Termux API
termux-sms-schedule -d "$phone_number" -m "$message" -s "$schedule_unixtime"

# Check if the scheduling was successful
if [ $? -eq 0 ]; then
  echo "SMS scheduled successfully!"
else
  echo "Failed to schedule SMS."
fi
