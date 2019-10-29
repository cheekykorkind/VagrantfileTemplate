#!/bin/bash

vm=$1

echo "set local env"
export KEY_ID=${vm['name']}
echo $KEY_ID