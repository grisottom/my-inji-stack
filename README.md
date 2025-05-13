# my-inji-stack

Project to share findings in deploy of inji-stack modules from github/mosip

- certify
- web
- mimoto
- wallet
- verify

. first using docker and
. then using k8s

## Requirements

### Choosing a VCI plugin for issuance
Recommended: Use one of the Existing Mock Plugin
Supported versions: 0.3.0 and above
Download the latest JAR from:
https://oss.sonatype.org/content/repositories/snapshots/io/mosip/certify/mock-certify-plugin/0.3.0-SNAPSHOT

Place the downloaded JAR in loader_path/certify/

#### Example

> cd docker/01_web_mimoto_certity/loader_path/certify/

> wget https://oss.sonatype.org/content/repositories/snapshots/io/mosip/certify/mock-certify-plugin/0.4.0-SNAPSHOT/mock-certify-plugin-0.4.0-20250402.041001-14.jar


### Create new client-id and onboard mimoto as OIDC client

https://docs.inji.io/inji-wallet/inji-mobile/technical-overview/customization-overview/credential_providers#create-new-client-id-and-onboard-mimoto-as-oidc-client