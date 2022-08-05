FROM ubuntu:20.04

RUN apt-get update
RUN apt-get install sudo
RUN sudo apt-get update
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo 'Asia/Shanghai' >/etc/timezone
RUN apt-get install wget -y
RUN apt-get install git -y
RUN apt-get install curl -y
RUN apt-get install unzip -y
RUN sudo apt install python3 -y
RUN sudo apt install python3-dev -y
RUN sudo apt install python3-pip -y
RUN sudo apt install python3-pillow -y
RUN sudo apt update

RUN apt-get install nginx -y

COPY root /
RUN apt install ffmpeg -y
RUN sudo chmod 777 /install.sh
RUN bash install.sh

RUN mv /nginx.conf /etc/nginx/



RUN mkdir /bot
COPY bot /bot
RUN chmod 0777 /bot/ -R


COPY /start.sh /
CMD chmod 0777 start.sh && bash start.sh
