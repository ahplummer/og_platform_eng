FROM ubuntu:18.04
LABEL maintainer="https://github.com/ahplummer"
ENV tf_version=0.15.3
# Do normal installs
RUN apt-get update && apt-get install -y \
    python3-pip \
    groff \
    git \
    libpq-dev \
    python-dev \
    libssl-dev \
    build-essential \
    libffi-dev \
    wget \
    curl \
    unzip \
    jq \
    apt-transport-https \
    ca-certificates \
    gnupg \
    golang-go \
    tmux \
    zsh \
    vim \
    nano

#Python related
RUN pip3 install --upgrade cffi
RUN pip3 install cryptography
RUN pip3 install awscli --upgrade
RUN pip3 install virtualenv

#Terraform
RUN wget https://releases.hashicorp.com/terraform/${tf_version}/terraform_${tf_version}_linux_amd64.zip
RUN unzip terraform_${tf_version}_linux_amd64.zip
RUN mv terraform /usr/local/bin/

#Azure CLI
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

#GCloud CLI
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - && apt-get update -y && apt-get install google-cloud-sdk -y

#SpaceVIM
RUN curl -sLf https://spacevim.org/install.sh | bash

#Oh-My-Zsh
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

#Kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
RUN chmod +x kubectl
RUN mv kubectl /usr/local/bin/

#Helm
RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

#Cloud Foundry
RUN wget -q -O - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | apt-key add -
RUN echo "deb https://packages.cloudfoundry.org/debian stable main" | tee /etc/apt/sources.list.d/cloudfoundry-cli.list
RUN apt-get update && apt-get install -y cf7-cli

RUN mkdir /host
ENV PATH="/host:${PATH}"
WORKDIR /host