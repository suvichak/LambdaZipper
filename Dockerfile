FROM public.ecr.aws/amazonlinux/amazonlinux:2023-minimal
RUN yum -y install git \
    python312 \
    python312-pip \
    zip \
    && yum clean all
RUN python3 -m pip install --upgrade pip \
    && python3 -m pip install boto3
RUN yum -y install python312*

ADD package.sh /
ENTRYPOINT ["/package.sh"]
