FROM debian:stretch
ENV T50_PATH /software/t50
USER root
ADD sources.list /etc/apt/sources.list
RUN apt-get -y  update && apt-get -y install wget make gcc 
RUN mkdir -p ${T50_PATH}
ADD . ${T50_PATH}
WORKDIR ${T50_PATH}
RUN cd ${T50_PATH} && wget https://jaist.dl.sourceforge.net/project/t50/t50-5.8/t50-5.8.4.tar.gz && \
tar zxvf t50-5.8.4.tar.gz && make && make install 
CMD ['/sbin/t50']
