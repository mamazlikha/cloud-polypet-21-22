#!/bin/bash

until [ $(curl --silent $BACKEND_HOST/actuator/health | grep UP -c ) == 1 ]
do
  echo "$BACKEND_HOST Not Ready"
  sleep 2
done

until [ $(curl --silent $CUSTOMER_CARE_HOST/actuator/health | grep UP -c ) == 1 ]
do
  echo "$CUSTOMER_CARE_HOST Not Ready"
  sleep 2
done

until [ $(curl --silent $PARTNER_1_HOST/status | grep SUCCESS -c ) == 1 ]
do
  echo "$PARTNER_1_HOST Not Ready"
  sleep 2
done

python3 main.py

echo "**** End of testing ******"


