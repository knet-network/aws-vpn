#!/usr/bin/env bash

set -x
set -e

vpn_server_name="${VPN_SERVER_NAME:-VPN Server}"

script_dir=`dirname "$0"`
source $script_dir/aws_get_instance_id.sh

instance_id=$(get_instance_id_by_name "${vpn_server_name}")
echo "About to start ${vpn_server_name} with instance_id ${instance_id}"

aws ec2 start-instances --instance-id "${instance_id}" | jq '.'
