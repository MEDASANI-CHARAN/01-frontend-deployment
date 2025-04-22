#!/bin/bash
app_Version=$1
dnf install ansible -y
pip3.9 install botocore boto3
ansible-pull -i localhost, -U https://github.com/MEDASANI-CHARAN/03-expense-ansible-roles.git frontend.yaml -e appVersion=$app_version
