# Get base Node (Ubuntu) image
FROM ubuntu:18.04

# Add maintainer details
MAINTAINER "Blair Nangle" "hi@blairnangle.com"

# Set working directory
WORKDIR /opt

# Install curl, wget and unzip
RUN apt-get update && apt-get install -y curl
RUN apt-get update && apt-get install -y wget
RUN apt-get update && apt-get install -y unzip

# Install Git
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata
RUN apt-get update && apt-get install -y git-all

# Install UTF-8 encoding
RUN apt-get update --fix-missing && apt-get install -y locales
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# Install specific version of Node
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs

# Install specific version of python3-pip
RUN apt-get install -y python3-pip

# Install specific version of Checkov
RUN pip3 install -Iv checkov==1.0.302

# Install specific version of Terraform
ENV TERRAFORM_VERSION=0.13.4
RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
RUN unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin/
RUN rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# Install specific version of awscli
RUN curl https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip
RUN unzip awscliv2.zip
RUN ./aws/install
RUN rm awscliv2.zip

# Install latest version of Elastic Beanstalk CLI
RUN pip3 install awsebcli --force-reinstall --upgrade
