```
docker build -t davidribyrne/ubuntu -f ubuntu.Dockerfile .
docker build -t davidribyrne/ubuntu-david -f ubuntu-david.Dockerfile .
docker build -t davidribyrne/ubuntu-build -f ubuntu-build.Dockerfile .
docker build -t davidribyrne/dali -f dali.Dockerfile .

docker run -p 127.0.0.1:2200:22 davidribyrne/ubuntu
```
