/****************************************************************
                  Mandatory Variables
****************************************************************/

// Enter the region of cloud sql
region              = "us-east4"
/* Enter the instance details. Remember if the instance fails to create, you will have to delete the instance manually
   rename the instance name below and in the Jenkins pipeline config and retrigger it. 
   This is because if it fails, Terraform will destroy the earlier instance and try to create one with the same name
   however GCP does not allow to re-use deleted instance name till 7 days from the deletion of the instance

   Remember the same name has to be mentioned in the Jenkins pipeline config as well otherwise it will error out
*/ 
name                = "saby-tf-pipline-04"
// The VPC network name
vpcnetwork          = "vpc-cvs-hub-nonprod-1"
// The Host VPC project name.. If you do not know then contact the GCP cloud Engineering group CvsGCPEngineering@CVSHealth.com
vpcproject          = "vpc-equinix-cvs"
// your GCP project name
project_id          = "digital-dfp-dev"
// Primary Database to be created
db_name             = "POSTGRESQLDB"
// name of the client certificate that wil be automatically created to enforce SSL connection
client_cert_name    = "clientapictecert"
/* any Labels to identify the instance. The recommended ones are given below
1. env
2. app ( application team name/train name etc etc)
3. itpr ( for billing purposes)
4. costcenter
5. dataclassification ( data classification .. proprietary, confidential or public
*/
user_labels = {
  "env" = "dev", "app" = "myapp", "itpr" = "itpr11111", "costcenter" = "mytrain",
  "dataclassification" = "proprietery"
}

/****************************************************************
                  Optional Variables
****************************************************************/
// database version if you want to override the default. The default is the latest and greatest out there
// refer to https://cloud.google.com/sql/docs/db-versions
database_version                = ""
// Initial disk size. Instance are always created to increase the size as the data increases
disk_size                       = 10
/* The tier of the instance. 
   Refere to https://cloud.google.com/sql/docs/postgres/instance-settings
*/
tier                            = "db-f1-micro"
/* enter the number of read replicas needed
 For read-heavy workloads, add read replicas to offload traffic from the primary instance.
 Example: for one read replica. add more if needed.. rarely
 Elements
 name : suffix to be added to the replica
 zone: zone where it must be created

 read_replicas                   = [
                                    {
                                      "name" = "-replica1"
                                      zone   = "us-east4-a"
                                    } 
                                  ]
*/
read_replicas                   = [
                                  ]
/*
  Additional databased to be created. Must be in this format
  Elements
  name: name of the database
  charset: charset of the database .. ( should be utf8)
  collation: collation of the database .. ( should be en_US.UTF8)
additional_databases            = [{ "name" = "add-anotherdb", "charset" = "utf8", "collation" = "en_US.UTF8" }]

*/
additional_databases            = []

/*
  Enter IAM Service Account for use in authentication if needed. Read crefully https://cloud.google.com/sql/docs/postgres/authentication
  cloud_IAM_SAusers                 = [
  { "name" = "k8s-infrastructure-temporary"}
]
*/
cloud_IAM_SAusers   = []

/*
  Enter cloud IAM user for authentication if needed. Read crefully https://cloud.google.com/sql/docs/postgres/authentication
cloud_IAM_users                 = [
  { "name" = "samalg@aetna.com" }
]
*/
cloud_IAM_users  = []

