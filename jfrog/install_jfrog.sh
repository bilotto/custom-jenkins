#!/bin/bash

helm upgrade -i jfrog jfrog/artifactory-jcr --version 107.63.12 \
  --namespace default \
  --set artifactory.artifactory.service.type=NodePort \
  --set artifactory.artifactory.nodePort=30000 \
  --set artifactory.nginx.https.enabled=true \
  --set artifactory.nginx.service.type=NodePort \
  --set artifactory.nginx.service.nodePort=32082 \
  --set artifactory.nginx.http.enabled=false  \
  --set artifactory.nginx.tlsSecretName=openet-ca-cert-secret \


# curl -XPOST -vu admin:password http://172.18.159.22:30000/artifactory/ui/jcr/eula/accept
