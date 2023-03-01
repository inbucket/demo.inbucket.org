# demo.inbucket.org

Ansible config that powers http://demo.inbucket.org

## Usage

1. Install ansible and dependencies (see `shell.nix`)
2. `ansible-galaxy collection install community.general`
3. `git clone https://github.com/inbucket/demo.inbucket.org`
4. `cd demo.inbucket.org`
5. Create a GCP project, and enable the [compute engine API]
6. Add your SSH key to the project to permit ansible VM access
7. Create a [service account] with Compute Admin role
8. Create & download JSON credentials from Service Account `keys` tab
9. Place JSON credentials for the account into `gcp-credentials.json`
10. Update `production.yml` to reflect your desired GCP project ID, region,
   and zone.
11. Run `./apply-production`
12. Use [VM instances] to find the External IP for `inbucket-demo-vm`

See also: http://inbucket.org/

[compute engine API]: https://console.cloud.google.com/apis/library/compute.googleapis.com 
[service account]:    https://console.cloud.google.com/iam-admin/serviceaccounts/create
[VM instances]:       https://console.cloud.google.com/compute/instances
