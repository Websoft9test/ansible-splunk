#!/bin/bash
splunk_dir="/opt"
splunk_user="splunk"
splunk_password="12345678"
[ -f /usr/bin/expect ] || yum -y install expect
/usr/bin/expect << EOF
set timeout 200
spawn ${splunk_dir}/splunk/bin/splunk start --accept-license
expect "username"
send "${splunk_user}\r"
expect "password"
send "${splunk_password}\r"
expect "password"
send "${splunk_password}\r"
set timeout 200
expect eof
exit