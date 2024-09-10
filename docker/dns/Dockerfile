FROM ubuntu:latest

RUN apt-get update; \
    apt-get install -y dnsmasq dnsdist

COPY dnsmasq.conf /etc/dnsmasq.conf
COPY dnsdist.conf /etc/dnsdist/dnsdist.conf
COPY selfsigned-key.pem selfsigned-cert.pem /etc/dnsdist/

CMD /bin/bash -c "service dnsdist start; /usr/sbin/dnsmasq --no-daemon --log-queries 2>&1 | grep -v root"
