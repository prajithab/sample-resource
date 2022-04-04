  terraform {
   backend "gcs" {
      bucket  = "_project_name-tf-state"
      prefix  = "_resourcecategory/_resourcetype/_name" // "cloudsql/postgresql/mytestdb"
    }
  }
  
  /*
    backend "gcs" {
      bucket  = "digital-dfp-dev-tf-state"
      prefix  = "bastion"
    }
  }
  */
  