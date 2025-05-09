#https://medium.com/@buffetbenjamin/keycloak-essentials-openid-connect-c7fa87d3129d
#https://www.keycloak.org/server/containers
#https://simonscholz.dev/tutorials/keycloak-realm-export-import
#https://www.keycloak.org/downloads-archive.html
docker run \
  -it \
  -p 8080:8080 \
  -p 8443:8443 \
  -p 9000:9000 \
  --rm \
  --name=keycloak \
  --network=mosip_network \
  -v ./keycloak/extra/health-check.sh:/opt/keycloak/health-check.sh \
  -v ./keycloak/realms/:/opt/keycloak/data/import \
  -v ./keycloak/certs/:/etc/ssl/certs/ \
  -e KC_BOOTSTRAP_ADMIN_USERNAME=admin \
  -e KC_BOOTSTRAP_ADMIN_PASSWORD=admin \
  -e KC_PROXY_HEADERS=xforwarded \
  -e KC_HTTP_ENABLED=true \
  -e KC_HTTP_RELATIVE_PATH=/idp \
  -e KC_HOSTNAME=https://localhost:8443/idp \
  -e KC_HOSTNAME_BACKCHANNEL_DYNAMIC=true \
  -e KC_HTTPS_CERTIFICATE_FILE=/etc/ssl/certs/keycloak.tls.crt \
  -e KC_HTTPS_CERTIFICATE_KEY_FILE=/etc/ssl/certs/keycloak.tls.key   \
  quay.io/keycloak/keycloak:latest start-dev \
  --import-realm \
  --feature=dpop

 #A realm is a space where you manage objects, including users, applications, roles, and groups. A user belongs to and logs into a realm.