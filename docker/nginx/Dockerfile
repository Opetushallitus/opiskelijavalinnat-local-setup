FROM ubuntu:latest

RUN apt-get update; \
    apt-get install -y curl nginx nano dnsmasq dnsdist

RUN mkdir -p /etc/nginx/ssl
COPY selfsigned-cert.pem selfsigned-key.pem /etc/nginx/ssl/
COPY localhost.conf /etc/nginx/conf.d

CMD /bin/bash -c "service nginx start; tail -f /var/log/nginx/access.log"
