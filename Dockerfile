FROM ubuntu:16.04
ENV T50_PATH /software/t50
# ADD sources.list /etc/apt/sources.list
RUN apt-get -y  update && apt-get -y install wget make gcc sudo 
# RUN apt-get -y install build-essential
RUN mkdir -p ${T50_PATH}
# ADD . ${T50_PATH}
WORKDIR ${T50_PATH}
# COPY .  ${T50_PATH}
RUN cd ${T50_PATH} && wget https://jaist.dl.sourceforge.net/project/t50/t50-5.8/t50-5.8.4.tar.gz && tar zxvf t50-5.8.4.tar.gz && ./configure && make && sudo make install 
RUN rm t50-5.8.4.tar.gz
#RUN ln -sn bin/t50 /usr/bin/t50 
# RUN groupadd -r t50 && useradd -r -g t50 t50 && \
# chown -R t50 ${T50_PATH} && chgrp -R t50 ${T50_PATH}
USER root
CMD ['t50', '--help']
# RUN nice -n 19 t50&
#RUN renice +999 -u root -p 1
