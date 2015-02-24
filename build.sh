#!/bin/bash

TLS='--tls'

echo "---- Updating base"
cd base
docker $TLS build -t tutum.co/k41n/redmine-docker-collection-base .
docker $TLS push tutum.co/k41n/redmine-docker-collection-base

echo "-------- Building 2.1.5"
cd ../2.1.5/base
docker $TLS build -t tutum.co/k41n/redmine-docker-collection-2_1_5-base .
docker $TLS push tutum.co/k41n/redmine-docker-collection-2_1_5-base

echo "------------ Building 2.1.5 MySQL"
cd ../mysql/base
docker $TLS build -t tutum.co/k41n/redmine-docker-collection-2_1_5-mysql-base .
docker $TLS push tutum.co/k41n/redmine-docker-collection-2_1_5-mysql-base

echo "---------------- Building 2.1.5 MySQL Redmine 2.6.1"
cd ../2.6.1/base
docker $TLS build -t tutum.co/k41n/redmine-docker-collection-2_1_5-mysql-2_6_1-base .
docker $TLS push tutum.co/k41n/redmine-docker-collection-2_1_5-mysql-2_6_1-base
