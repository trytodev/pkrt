terraform {
  backend "gcs" {
    bucket          = "dev-sec-ops-74eeb1bd"
    prefix          = "/terraform.tfstate"
  }
}
