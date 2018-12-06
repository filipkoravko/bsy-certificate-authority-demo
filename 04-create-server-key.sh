#!/bin/bash

cd ca

NAME=server.cz
CERT_TYPE=server_cert

#generate private key"
openssl genrsa \
        -out intermediate/private/${NAME}.key.pem 2048
chmod 400 intermediate/private/${NAME}.key.pem

#create csr
openssl req -config intermediate.cnf -new -sha256 \
        -key intermediate/private/${NAME}.key.pem \
        -out intermediate/csr/${NAME}.csr.pem

#create certificate
openssl ca -config intermediate.cnf -extensions ${CERT_TYPE} \
        -days 375 -notext -md sha256 \
        -in intermediate/csr/${NAME}.csr.pem \
        -out intermediate/certs/${NAME}.cert.pem
chmod 444 intermediate/certs/${NAME}.cert.pem

#verify certificate
openssl x509 -noout -text \
      -in intermediate/certs/${NAME}.cert.pem

#verify with chain
openssl verify -CAfile intermediate/certs/ca-chain.cert.pem \
      intermediate/certs/${NAME}.cert.pem

cp intermediate/certs/${NAME}.cert.pem ../certs/
cp intermediate/private/${NAME}.key.pem ../certs/
