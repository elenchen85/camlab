#!/bin/sh
# Clean up the old container
echo *INFO* Cleaning up old Faststart OpenLDAP container
docker stop faststart-openldap > /dev/null 2>&1
docker rm faststart-openldap > /dev/null 2>&1
rm -rf database/* > /dev/null 2>&1
rm -f database/.DS* > /dev/null 2>&1
rm -f database/._.DS* > /dev/null 2>&1

echo *INFO* Starting Faststart OpenLDAP container
docker pull osixia/openldap:1.1.7 > /dev/null 2>&1
echo *INFO* Docker pull completed RC $?
docker run --env LDAP_ORGANISATION="IBM" --env LDAP_DOMAIN="ibm.com" --env LDAP_ADMIN_PASSWORD="Passw0rd1" \
--publish 389:389 --publish 636:636 \
--volume /root/scripts/ldapworking:/container/service/slapd/assets/test \
--volume /root/scripts/ldapworking/database:/var/lib/ldap \
--name faststart-openldap \
--detach osixia/openldap:1.1.7  > /dev/null 2>&1
echo *INFO* Docker run completed RC $?

echo *INFO* Waiting till we can connect to OpenLDAP container
docker exec faststart-openldap ldapsearch -x -h localhost -b dc=ibm,dc=com -D "cn=admin,dc=ibm,dc=com" -w Passw0rd1 > /dev/null 2>&1
while [ $? -ne 0 ]
do
	echo *INFO* Unable to connect - waiting for 5 seconds
	sleep 5
	docker exec faststart-openldap ldapsearch -x -h localhost -b dc=ibm,dc=com -D "cn=admin,dc=ibm,dc=com" -w Passw0rd1 > /dev/null 2>&1
done

echo *INFO* Connected!
docker exec faststart-openldap ldapsearch -x -h localhost -b dc=ibm,dc=com -D "cn=admin,dc=ibm,dc=com" -w Passw0rd1

echo *INFO* Adding users and groups
docker exec faststart-openldap ldapadd -x -h localhost -D "cn=admin,dc=ibm,dc=com" -w Passw0rd1 -f /container/service/slapd/assets/test/default.ldif

echo *INFO* Listing users and groups
docker exec faststart-openldap ldapsearch -x -h localhost -b dc=ibm,dc=com -D "cn=admin,dc=ibm,dc=com" -w Passw0rd1

When you come to configure your LDAP connection in ICP, use these values

You will need to change 'URL', 'Connection Name' and 'Bind DN Password'

echo Connection Name: 		'SB'
echo Server Type:					'Custom'
echo Base DN:							'dc=ibm,dc=com'
echo Bind DN:							'cn=admin,dc=ibm,dc=com'
echo Bind DN Password: 		'Passw0rd1'
echo URL:									'ldap://10.135.148.210:389'
echo Group filter:				'&(cn=%v)(objectclass=groupOfUniqueNames))'
echo User filter:					'(&(uid=%v)(objectclass=inetOrgPerson))'
echo Group ID Map:				'*:cn'
echo User ID Map:					'*:uid'
echo Group member ID map: 'groupOfUniqueNames:uniqueMember'
