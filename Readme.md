Hello! Here are results for test task.
1. Terraform code for creation dataset and table available in repository in terraform folder. Variable "service_account_json" is used in Jenkins later, "schema_json" contains table schema.
2. Script available in docker\bigquery\scripts folder and added to Docker image.
3. Yaml file to run job in Minikube available in kubernetes\bigquery-add-data folder. Configmap is used to pass GCLOUD_PROJECT variable to job, job itself uses volumeMounts to mount application_default_credentials.json from secret, secret uses data from host machine after impersonation.
4. Code from step 1 contains changes for creating View, but in this case it is uncommented.
5. To trigger Terraform changes with Github I’ve used Poll SCM with cron H/5 * * * *, as result after merging changes from branch to master – pipeline “Started by an SCM change”, pipeline available in jenkins/big-query-post-merge folder.
6. To view vulnerabilities in bigquery image I’ve used curl as mentioned in https://cloud.google.com/artifact-analysis/docs/investigate-vulnerabilities
