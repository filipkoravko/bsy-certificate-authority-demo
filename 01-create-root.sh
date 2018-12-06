#!/bin/bash

#create dir structure for root
mkdir ca

cp root.cnf ./ca/
cp intermediate.cnf ./ca/

cd ca
mkdir certs crl newcerts private
chmod 700 private
touch index.txt
echo 1000 > serial
echo 1000 > crlnumber


#create the root key
openssl genrsa -aes256 -out private/ca.key.pem 4096
chmod 400 private/ca.key.pem

#create the root certificate
openssl req -config root.cnf \
      -key private/ca.key.pem \
      -new -x509 -days 7300 -sha256 -extensions v3_ca \
      -out certs/ca.cert.pem
chmod 444 certs/ca.cert.pem

#verify root
openssl x509 -noout -text -in certs/ca.cert.pem