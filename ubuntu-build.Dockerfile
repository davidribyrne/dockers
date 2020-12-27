# docker build -t davidribyrne/build -f build.Dockerfile .
FROM davidribyrne/ubuntu
RUN apt-get install -y build-essential git
