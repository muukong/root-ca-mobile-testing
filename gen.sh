#!/bin/sh

# Genereate root CA key
openssl genrsa -out rootCA_key.pem 4096

# Convert key to DER format
openssl rsa -in rootCA_key.pem -inform pem -out rootCA_key.der -outform der

# Create self-signed root certificate
openssl req -new -x509 -config openssl-ca.cnf -key rootCA_key.pem -out rootCA_cert.pem

# Convert root certificate to DER format
openssl x509 -in rootCA_cert.pem -inform pem -out rootCA_cert.der -outform der

# Create PKCS#12 (PFX) certificate (contains private key!)
openssl pkcs12 -export -in rootCA_cert.pem -inkey rootCA_key.pem -out rootCA_cert.p12


