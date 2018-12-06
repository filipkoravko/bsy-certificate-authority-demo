#!/bin/bash

curl -v \
    --cacert ./ca-chain.cert.pem \
    https://server.cz:9443/results.txt