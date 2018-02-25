#!/bin/bash
# create-gce-instance.sh <instance name>

primary="inbucket-demo-1"
primary_address="inbucket-demo"

name="${1:-inbucket-demo-1}"
if test "$name" == "$primary"; then
  # only primary gets the static address
  addr_opt="--address=$primary_address"
fi

set -x
gcloud compute instances create "$name" --machine-type=f1-micro \
  --image-project=coreos-cloud --image-family=coreos-stable \
  --metadata-from-file=user-data=config.ign --tags=http-server $addr_opt
