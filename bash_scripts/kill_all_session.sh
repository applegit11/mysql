#!/bin/bash
# kill掉 数据库中所有的会话id，暴力，用于CPU持续飙高，临时解决问题
user=
password=""
host=localhost
port=3306
 
 
mysql -u$user -p$password -h$host  -P$port -e "select concat('kill ',id,';') from information_schema.processlist" > tmpfile
 
awk '{if (NR != 1) print $0 }' tmpfile | mysql -u$user -p$password -h$host  -P$port
