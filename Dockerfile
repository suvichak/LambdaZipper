FROM public.ecr.aws/amazonlinux/amazonlinux:2023
#FROM public.ecr.aws/lambda/python:3.12
Run yum install openssl openssl-devel -y
Run yum install zip -y
Run yum groupinstall "Development Tools" -y
Run yum install gcc bzip2-devel libffi-devel -y
RUN dnf install -y gzip make tar wget which openssl \
         bzip2-devel gcc-c++ libffi-devel openssl-devel \
         openssh-clients sqlite-devel zlib-devel readline-devel \
         && dnf clean all
RUN wget -nv https://www.python.org/ftp/python/3.12.3/Python-3.12.3.tgz \
        && tar xzf Python-3.12.3.tgz \
        && cd Python-3.12.3 \ 
        && ./configure --enable-optimizations 
RUN cd Python-3.12.3 \
	&& make install 



ADD package.sh /
ENTRYPOINT ["/package.sh"]
