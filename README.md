# demo.inbucket.org

GCP CoreOS+ignition config that powers http://demo.inbucket.org

## Usage

1. Install [gcloud compute] CLI locally on Linux or OS X
2. Run `gcloud init`
3. *Optional:* Set a default zone
4. `git clone https://github.com/jhillyerd/demo.inbucket.org`
5. `cd demo.inbucket.org`
6. Run `./create-gce-instance.sh inbucket-vm`
7. Use [VM instances] to find the External IP for `inbucket-vm`

You can also use Google Cloud Shell instead of setting up gcloud locally, just
start at step 4 above.

See also: http://inbucket.org/

[gcloud compute]: https://cloud.google.com/compute/docs/gcloud-compute/
[VM instances]:   https://console.cloud.google.com/compute/instances
