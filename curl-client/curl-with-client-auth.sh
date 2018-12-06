#!/bin/bash

curl \
    --cacert ./ca-chain.cert.pem \
    --key ./student-auth.key.pem \
    --cert ./student-auth.cert.pem \
    https://server.cz:9443/results.txt