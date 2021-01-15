# docker build -t davidribyrne/dali -f dali.Dockerfile .
FROM davidribyrne/ubuntu-build
RUN apt-get update
RUN apt-get install -y mtd-utils arj lhasa cabextract cramfsswap squashfs-tools zlib1g-dev liblzma-dev liblzo2-dev sleuthkit srecord cpio python3-crypto python3-tk python3-lzo libqt5opengl5 fusecram squashfuse python-crypto python-tk python3-pip

RUN curl https://bootstrap.pypa.io/get-pip.py | sudo python2.7 -

RUN pip3 install pylzma matplotlib capstone cstruct==1.0

RUN mkdir /home/david/binwalk

WORKDIR /home/david/binwalk
RUN git clone https://github.com/davidribyrne/cramfs
WORKDIR /home/david/binwalk/cramfs
RUN make
RUN install mkcramfs /usr/local/bin
RUN install cramfsck /usr/local/bin

WORKDIR /home/david/binwalk
RUN git clone https://github.com/devttys0/yaffshiv
WORKDIR /home/david/binwalk/yaffshiv
RUN python2 setup.py install

WORKDIR /home/david/binwalk
RUN git clone https://github.com/devttys0/sasquatch
WORKDIR /home/david/binwalk/sasquatch
RUN ./build.sh

WORKDIR /home/david/binwalk
RUN git clone https://github.com/sviehb/jefferson
WORKDIR /home/david/binwalk/jefferson
RUN sudo python2 setup.py install

WORKDIR /home/david/binwalk
RUN mkdir stuffit
WORKDIR /home/david/binwalk/stuffit
RUN wget http://downloads.tuxfamily.org/sdtraces/stuffit520.611linux-i386.tar.gz
RUN tar -xf stuffit520.611linux-i386.tar.gz
RUN cp bin/unstuff bin/stuff /usr/local/bin/
RUN mkdir -p /usr/local/man/man1
RUN cp man/man1/* /usr/local/man/man1

WORKDIR /home/david/binwalk
RUN git clone https://github.com/jrspruitt/ubi_reader
WORKDIR /home/david/binwalk/ubi_reader
RUN git reset --hard 0955e6b95f07d849a182125919a1f2b6790d5b51
RUN sudo python2 setup.py install

WORKDIR /opt
RUN git clone https://github.com/rampageX/firmware-mod-kit/
WORKDIR /opt/firmware-mod-kit/src/bff
RUN make

WORKDIR /home/david/binwalk
RUN git clone https://github.com/ReFirmLabs/binwalk
WORKDIR /home/david/binwalk/binwalk
RUN python3 setup.py install


