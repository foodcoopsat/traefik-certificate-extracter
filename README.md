# traefik certificate extracter

Extract a certificate from [traefiks acme storage](https://doc.traefik.io/traefik/https/acme/#storage) and store it as a file.

Environment variables:

- `DOMAIN`: domain name of the certificate to extract
- `INPUT_PATH`: file path to traefiks acme storage file
- `OUTPUT_PATH`: file path where to store the extracted certificate
- `RESOLVER`: name of traefiks resolver
