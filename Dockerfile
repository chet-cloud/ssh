FROM ubuntu:latest

RUN apt update

RUN apt install  openssh-server sudo -y

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 test 

RUN usermod -aG sudo test

RUN service ssh start

RUN  echo 'test:test' | chpasswd

EXPOSE 22

ADD ./ngrok /bin/ngrok
ADD ./start.sh /etc/start.sh

RUN chmod +x /bin/ngrok
RUN chmod +x /etc/start.sh

RUN apt install tmux vim curl wget git -y

RUN curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -
RUN apt install -y nodejs

ENTRYPOINT  /etc/start.sh

