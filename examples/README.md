## Running this example manually

1. Sign up for [GCP](https://cloud.google.com/).
2. Configure your GCP credentials using below command.
   ```
   export GOOGLE_APPLICATION_CREDENTIALS=<GCP credentials.json>
   ```
3. Install [Terraform](https://www.terraform.io/) and make sure it's on your `PATH`.
4. Run `terraform init`.
5. Run `terraform plan -var-file=<.tfvars file> ex:- nprod.tfvars/prod.tfvars`.
6. Run `terraform apply -var-file=<.tfvars file> -auto-approve ex:- nprod.tfvars/prod.tfvars`.
7. This module will output the SQL instance details like below .
   ```
   instance_connection_name = 
   instance_name = 
   instance_self_link = 
   instance_service_account_email_address = 
   private_address = 
   ```
8. When you're done, run `terraform destroy`.