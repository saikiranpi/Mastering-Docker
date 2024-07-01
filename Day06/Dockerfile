FROM gcr.io/distroless/static-debian11
LABEL name="saikiran"
RUN mkdir /app \
    && roupadd appuser && useradd -r -g appuser appuser \
    && apt update && apt install -y jq net-tools curl wget unzip\
    && apt install -y nginx iputils-ping \
    && wget https://releases.hashicorp.com/terraform/${T_VERSION}/terraform_${T_VERSION}_linux_amd64.zip \
    && wgt https://releases.hashicorp.com/packer/${P_VERSION}/packer_${P_VERSION}_linux_amd64.zip\
    && unzip terraform_${T_VERSION}_linux_amd64.zip  && unzip packer_${P_VERSION}_linux_amd64.zip\
    && chmod 777 terraform && chmod 777 packer\
    && ./terraform version && ./packer version
WORKDIR /app 
USER  appuser
ENV AWS_ACCESS_KEY_ID=DUMMYKEY\
    AWS_SECRET_KEY_ID=DUMMYKEY\
    AWS_DEFAULT_REGION=US-EAST-1A
# COPY index.nginx-debian.html /var/www/html/
# COPY scorekeeper.js /var/www/html
# ADD  style.css /var/www/html
ADD https://releases.hashicorp.com/terraform/1.9.0/terraform_1.9.0_linux_amd64.zip /var/www/html
ARG T_VERSION='1.6.6'\
    P_VERSION='1.8.0'
EXPOSE 80
RUN 

# RUN  
USER  appuser
CMD ["nginx","-g","daemon off;"]
