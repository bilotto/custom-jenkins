# Use a imagem especificada do Jenkins como base
FROM bitnami/jenkins:2.426.1-debian-11-r3

USER 0
RUN mkdir -p /usr/share/jenkins/ref
# ADD plugins.tar.gz /usr/share/jenkins/ref
ADD scriptApproval.xml /usr/share/jenkins/ref

USER 1001