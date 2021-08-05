FROM debian:10.10
ADD set-nginx.sh /opt/set-nginx.sh
ADD entrypoint.sh /opt/entrypoint.sh
ADD app/XrayR /usr/local/XrayR/
RUN mkdir /etc/XrayR/
ADD app/etc/* /etc/XrayR/
RUN echo $PORT
RUN apt update&&apt install ca-certificates curl nginx -y
RUN chmod +x /opt/*&& chmod +x /usr/local/XrayR/XrayR
RUN /opt/set-nginx.sh

ENTRYPOINT ["sh", "-c", "/opt/entrypoint.sh"]
