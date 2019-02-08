FROM centos:latest

ENV ROOT_PASS="bitrix" \
    TIMEZONE="Europe/Moscow" \
    container="docker"

RUN echo "root:$ROOT_PASS" | chpasswd && \
    yum install -y openssh-server && \
    sed -e "s#/usr/libexec/openssh/sftp-server#internal-sftp#; s/#UseDNS yes/UseDNS no/" -i /etc/ssh/sshd_config && \
    cp -f /usr/share/zoneinfo/$TIMEZONE /etc/localtime

CMD "/sbin/init"
