#!/bin/bash

cd ca

#create crl
openssl ca -config root.cnf \
      -gencrl -out crl/root.crl.pem

#check content 
openssl crl -in crl/root.crl.pem -noout -text
