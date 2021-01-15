FROM kalilinux/kali-rolling:latest

RUN apt-get update
RUN apt-get install -y openssh-server
RUN apt-get install -y sudo
RUN apt-get install -y wget
RUN apt-get install -y bash-completion
RUN apt-get install -y curl
RUN apt-get install -y iputils-ping
RUN apt-get install -y net-tools
RUN apt-get install -y nmap
RUN apt-get install -y ncat
RUN apt-get install -y masscan
RUN apt-get install -y tcpdump
RUN apt-get install -y bettercap bettercap-ui

RUN apt-get upgrade -y

RUN mkdir /var/run/sshd
RUN sed -ri 's/#PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config
RUN sed -ri 's/#PubkeyAuthentication.*/PubkeyAuthentication yes/' /etc/ssh/sshd_config
RUN sed -i /etc/sudoers -re 's/^%sudo.*/%sudo ALL=(ALL:ALL) NOPASSWD: ALL/g'

RUN useradd --groups sudo --create-home --shell /bin/bash --user-group david
RUN mkdir -p /home/david/.ssh
RUN wget -O /home/david/.ssh/authorized_keys https://github.com/davidribyrne.keys
RUN chmod 700 /home/david/.ssh
RUN chmod 600 /home/david/.ssh/authorized_keys
RUN chown -R david:david /home/david

RUN apt-get clean
EXPOSE 22
CMD    ["/usr/sbin/sshd", "-D"]
