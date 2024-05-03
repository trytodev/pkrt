ARG IMAGE_TAG=2.440.2

FROM jenkins/jenkins:2.440.2
USER root
RUN apt-get update && \
    apt-get install -y \
        apt-transport-https \
        curl \
        software-properties-common \
        wget \
        && \
    wget -O- https://apt.releases.hashicorp.com/gpg | \
        gpg --dearmor | \
        tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null && \
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
        https://apt.releases.hashicorp.com bookworm main" | \
        tee /etc/apt/sources.list.d/hashicorp.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg \
        | gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" \
        | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    apt-get update && \
    apt-get install -y \
        google-cloud-cli \
        terraform

USER jenkins
