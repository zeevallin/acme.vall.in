FROM joohoi/acme-dns
RUN mkdir -p /var/certs

VOLUME ["/etc/acme-dns", "/var/lib/acme-dns", "/var/certs"]
ENTRYPOINT ["./acme-dns"]
EXPOSE 53 80 443
EXPOSE 53/udp
