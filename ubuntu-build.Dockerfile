# docker build -t davidribyrne/ubuntu-build -f ubuntu-build.Dockerfile .
FROM davidribyrne/ubuntu-david
RUN apt-get install -y build-essential git default-jdk ant maven ccache
