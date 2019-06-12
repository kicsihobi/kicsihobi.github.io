#!/bin/bash
openssl genrsa -out $(dirname $0)/rsa_key.pem 4096
openssl rsa -pubout -in $(dirname $0)/rsa_key.pem -out $(dirname $0)/rsa_pub.pem
echo "var pub=" > $(dirname $0)/../js/pub.js;
cat $(dirname $0)/rsa_pub.pem | sed "s|^|\"|g" | sed "s|$|\\\n\"+|g" >> $(dirname $0)/../js/pub.js
echo "\"\"" >> $(dirname $0)/../js/pub.js;
