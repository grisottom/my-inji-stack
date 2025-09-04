FROM alpine:latest

# Zscaler SSL Errors within Docker Build Process
# https://community.zscaler.com/s/question/0D54u00009evmooCAA/zscaler-ssl-errors-within-docker-build-process
ADD ZscalerRootCertificate-2048-SHA256.crt /usr/local/share/ca-certificates/ZscalerRootCertificate.crt
RUN chmod 644 /usr/local/share/ca-certificates/ZscalerRootCertificate.crt
# update-ca-certificates
RUN cat /usr/local/share/ca-certificates/ZscalerRootCertificate.crt >> /etc/ssl/certs/ca-certificates.crt 
ENV REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt

RUN apk --no-cache -U add python3 && \
    apk upgrade --no-cache -U -a  
# Patch OpenSSL vulnerability^

EXPOSE 8000
WORKDIR /serve

ENTRYPOINT [ "python3", "-m", "http.server", "8000" ]