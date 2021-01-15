# docker build -t davidribyrne/dali -f dali.Dockerfile .
FROM davidribyrne/ubuntu-build
RUN apt-get update
RUN apt-get install -y mtd-utils arj lhasa cabextract cramfsswap squashfs-tools zlib1g-dev liblzma-dev liblzo2-dev sleuthkit srecord cpio python3-crypto python3-tk python3-lzo libqt5opengl5 fusecram squashfuse python-crypto python-tk 

RUN curl https://bootstrap.pypa.io/get-pip.py | sudo python2.7 -

