#Mandatory Variables
region              = "us-east4"
name                = "pegasus-poc-sprint6-postgresql-prod01-val"
vpcnetwork          = "vpc-cvs-hub-nonprod-1"
vpcproject          = "vpc-equinix-cvs"
project_id          = "digital-dfp-dev"
db_name             = "POSTGRESQLDB"
// user_password       = "-350Mx"
# encryption_key_name = "projects/digital-dfp-dev/locations/us-east4/keyRings/digital-dfp-dev-terratest/cryptoKeys/digital-dfp-dev-terratest"
client_cert_name    = "clientapictecert"
user_labels = {
  "env"                = "dev", "app" = "pegasus", "itpr" = "dfp-team-pegasus", "costcenter" = "dfp",
  "dataclassification" = "pegasus"
}

#optional Variables
disk_size                       = 10
tier                            = "db-f1-micro"
read_replicas                   = [
                                    {
                                      "name" = "-pega1"
                                      zone   = "us-east4-a"
                                    } 
                                    , {
                                      "name" = "-pega2"
                                      zone   = "us-east4-b"
                                    }
                                  ]
additional_databases            = [{ "name" = "add-pega", "charset" = "utf8", "collation" = "en_US.UTF8" }]
/*
additional_users                = [
    { "name" = "addusr1-pega", "host" = "%", "password" = "utf8generalci" }
     ,{ "name" = "addusr2-pega", "host" = "%", "password" = "utf8generalci" }
]
*/
cloud_IAM_SAusers                 = [
  { "name" = "k8s-infrastructure-temporary"}
]
cloud_IAM_users                 = [
  { "name" = "samalg@aetna.com" }
]

