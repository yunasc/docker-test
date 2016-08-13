FROM nginx:stable
ARG ENVIRONMENT=local
ENV ENVIRONMENT ${ENVIRONMENT}

RUN apt-get update

RUN apt-get install -y git

RUN mkdir /root/.ssh
RUN touch /root/.ssh/known_hosts
RUN ssh-keyscan github.com >> /root/.ssh/known_hosts

WORKDIR /usr/share/nginx
RUN git clone http://github.com/yunasc/docker-test-code
RUN rm -rf html
RUN mv docker-test-code html
RUN git clone http://github.com/yunasc/docker-test-config /root/docker-test-config
RUN export
RUN cp /root/docker-test-config/$ENVIRONMENT/config.js html/