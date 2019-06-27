# t50 Download
https://jaist.dl.sourceforge.net/project/t50/t50-5.8/t50-5.8.4.tar.gz


## Use
```
docker run -it --rm  --privileged actanble/docker-t50 t50 192.168.2.99 --flood
```

## Note
- You Must Add `--privileged ` in line, if not do so then you'll not run t50 well.
- [t50-does-not-work-with-docker-container](https://stackoverflow.com/questions/31927417/t50-does-not-work-with-docker-container)

## Build Your self 

```
FROM ubuntu:16.04
ENV T50_PATH /software/t50
ADD sources.list /etc/apt/sources.list
RUN apt-get -y  update && apt-get -y install wget make gcc sudo 
RUN apt-get -y install build-essential
RUN mkdir -p ${T50_PATH}
ADD . ${T50_PATH}
WORKDIR ${T50_PATH}
COPY .  ${T50_PATH}
RUN cd ${T50_PATH} && tar zxvf t50-5.8.4.tar.gz 
RUN ./configure && make && sudo make install 
CMD ['t50']
```
