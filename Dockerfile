# BitTorrent Sync
#
# VERSION               0.1

FROM ubuntu:15.04
MAINTAINER Christophe Borcard <christophe@borcard.eu>
LABEL com.getsync.version=“2.4.0”

ADD https://download-cdn.resilio.com/stable/linux-x64/resilio-sync_x64.tar.gz /tmp/sync.tgz
RUN tar -xf /tmp/sync.tgz -C /usr/sbin rslsync && rm -f /tmp/sync.tgz

COPY btsync.conf /etc/
COPY run_sync /opt/

EXPOSE 12888
EXPOSE 55512

VOLUME /mnt/sync

ENTRYPOINT ["/opt/run_sync"]
CMD ["--config", "/etc/btsync.conf"]
