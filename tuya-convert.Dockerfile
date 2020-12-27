# docker build -t davidribyrne/tuya-convert -f tuya-convert.Dockerfile .
FROM davidribyrne/build

RUN su - david -c "cd /home/david; git clone https://github.com/ct-Open-Source/tuya-convert"
RUN su - david -c "cd /home/david/tuya-convert; ./install_prereq.sh"
