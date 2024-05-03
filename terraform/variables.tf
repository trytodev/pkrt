variable "service_account_json" {
  description = "Path to the service account JSON file"
  default     = "/var/jenkins_home/workspace/bigquery-post-merge/terraform/secret-key-file.json"
  type        = string
}

variable "project_id" {
  description = "The ID of the project in which resources will be managed"
  default     = "studied-beanbag-422111"
  type        = string
}

variable "schema_json" {
  description = "Path to the schema JSON file"
  default     = "schema.json"
  type        = string
}
