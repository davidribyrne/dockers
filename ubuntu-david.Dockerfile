# docker build -t davidribyrne/ubuntu-david -f ubuntu-david.Dockerfile .
FROM davidribyrne/ubuntu
RUN echo y | unminimize
RUN rm /etc/apt/apt.conf.d/docker-gzip-indexes
RUN apt-get install -y man man-db less gzip bzip2 tar p7zip-full unzip lzop unrar-free bash-completion command-not-found screen aria2 bmon vim zip pigz 
RUN apt-get update