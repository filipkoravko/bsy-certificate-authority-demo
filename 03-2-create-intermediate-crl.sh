#!/bin/bash

cd ca

#create crl
openssl ca -config intermediate.cnf \
      -gencrl -out intermediate/crl/intermediate.crl.pem

#check content 
openssl crl -in intermediate/crl/intermediate.crl.pem -noout -text

cat intermediate/crl/intermediate.crl.pem crl/root.crl.pem > ../certs/server.crl.pem