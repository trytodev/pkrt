FROM docker.io/ubuntu:20.04

ARG JENKINS_HOME=/home/jenkins
ARG JENKINS_USER_UID=1000
ARG JENKINS_USER=jenkins

ENV JENKINS_HOME=${JENKINS_HOME} \
    JENKINS_USER_UID=${JENKINS_USER_UID} \
    JENKINS_USER=${JENKINS_USER}

RUN apt-get update && \
    apt-get install -y \
        python3 \
        python3-pip \
        && \
    pip3 install google-cloud-bigquery

RUN groupadd -g ${JENKINS_USER_UID} ${JENKINS_USER} && \
    useradd -u ${JENKINS_USER_UID} \
        -g ${JENKINS_USER} \
        ${JENKINS_USER} \
        -ms /bin/bash \
        -d ${JENKINS_HOME}

COPY --chown=${JENKINS_USER}:${JENKINS_USER} scripts ${JENKINS_HOME}/scripts

USER ${JENKINS_USER}
WORKDIR ${JENKINS_HOME}
