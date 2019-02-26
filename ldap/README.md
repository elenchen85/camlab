# OpenLDAP Server Install & Configuration

Refer to: https://github.ibm.com/IBMPrivateCloud/roadmap/blob/master/feature-specs/open_ldap_configuration.md

Execute `./go.sh` and it will ...

- clean up existing ldap container
- define a new ldap server in a container
- define 50 users of the form ..

user01 > user50 with a password of `ReallyStrongPassw0rd`

To get a shell on the container run `docker exec -ti faststart-openldap /bin/sh`

The local files in /root/scripts/ldap are mapped to /container/service/slapd/assets/test in the container

The persistent LDAP database /root/scripts/ldap/database mapped to /var/lib/ldap
