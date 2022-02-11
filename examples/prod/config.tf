  terraform {
    backend "gcs" {
      bucket  = "digital-dfp-dev-tf-state"
      prefix  = "sample"
    }
  }