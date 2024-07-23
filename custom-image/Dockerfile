# Use a imagem especificada do Jenkins como base
# version already using
FROM bitnami/jenkins:2.452.1-debian-12-r2
# version from mpdk specs
# FROM bitnami/jenkins:2.235.2-debian-10-r5

USER 0
RUN mkdir -p /usr/share/jenkins/ref
# ADD plugins.tar.gz /usr/share/jenkins/ref
ADD scriptApproval.xml /usr/share/jenkins/ref

# Instalar Helm
RUN curl https://get.helm.sh/helm-v3.13.1-linux-amd64.tar.gz | tar xz && \
    mv linux-amd64/helm /usr/local/bin/helm && \
    rm -rf linux-amd64

# Instalar kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.19.0/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl

# Install openshift client
RUN curl -L https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/openshift-client-linux.tar.gz | tar xz && \
    mv oc /usr/local/bin/oc


USER 1001