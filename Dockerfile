FROM ubuntu

ENV LANG C.UTF-8

RUN set -x && \
    apt update && \
    apt install -y kmod perl strongswan xl2tpd ppp \
    && mkdir -p /var/run/xl2tpd \
    && touch /var/run/xl2tpd/l2tp-control 

COPY ipsec.conf /etc/ipsec.conf
COPY ipsec.secrets /etc/ipsec.secrets
COPY xl2tpd.conf /etc/xl2tpd/xl2tpd.conf
COPY options.l2tpd.client /etc/ppp/options.l2tpd.client
COPY xl2tpd /usr/sbin/xl2tpd  
COPY xl2tpd-control /usr/sbin/xl2tpd-control
COPY startup.sh /

CMD ["/startup.sh"]
