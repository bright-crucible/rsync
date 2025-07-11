FROM alpine:latest
ARG UID=1000
ARG GID=1000
ENV TZ America/Los_Angeles
RUN apk add --no-cache \
        tzdata \
        openssh-server \
        rsync \
        rssh \
        shadow \
    && sed -i "s/#PermitRootLogin prohibit-password/PermitRootLogin no/g" \
        /etc/ssh/sshd_config \
    && sed -i "s/#PasswordAuthentication yes/PasswordAuthentication no/g" \
        /etc/ssh/sshd_config \
    && sed -i "s/#PubkeyAuthentication yes/PubkeyAuthentication yes/g" \
        /etc/ssh/sshd_config \
    && cp /etc/rssh.conf.default /etc/rssh.conf \
    && sed -i "s/#allowrsync/allowrsync/g" /etc/rssh.conf \
    && addgroup -S rsync -g $GID \
    && adduser -s /usr/bin/rssh -u $UID -S rsync -G rsync \
    && usermod -p '*' rsync \
    && mkdir \
        /home/rsync/.ssh \
        /home/rsync/data \
    && chown rsync:rsync \
        /home/rsync/.ssh \
        /home/rsync/data
COPY keys/ssh_host_* /etc/ssh/
CMD ["/usr/sbin/sshd", "-D", "-p", "22022"]
