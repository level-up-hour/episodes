FROM fedora
RUN dnf install -y net-tools && \
    dnf clean all
VOLUME /opt
ENTRYPOINT ["/usr/bin/netstat"]
