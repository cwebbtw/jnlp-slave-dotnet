FROM jenkins/jnlp-slave:3.19-1

MAINTAINER Christopher Webb <cwebb@thoughtworks.com>

USER root

ENV DOTNET_RUNTIME_VERSION=2.0.6 \
    DOTNET_SDK_VERSION=2.1.4

RUN apt-get update                                                          && \
    apt-get install -y --no-install-recommends wget ruby curl apt-transport-https gpg && \
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor     \
        > /etc/apt/trusted.gpg.d/microsoft.gpg                              && \
    echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-stretch-prod stretch main" \
        > /etc/apt/sources.list.d/dotnetdev.list                            && \
    apt-get update                                                          && \
    apt-get install -y --no-install-recommends dotnet-runtime-$DOTNET_RUNTIME_VERSION dotnet-sdk-$DOTNET_SDK_VERSION

USER jenkins
