provider "google" {
  credentials = file(var.service_account_json)
  project     = var.project_id
  region      = "europe-central2-a"
}

resource "random_id" "suffix" {
  byte_length               = 4
}

resource "google_storage_bucket" "state-bucket" {
  name     = "dev-sec-ops-${random_id.suffix.hex}"
  location = "europe-central2"
  storage_class = "STANDARD"
  public_access_prevention = "enforced"

  versioning {
    enabled = true
  }
}

resource "google_bigquery_dataset" "dataset" {
  dataset_id                  = "my_dataset"
  friendly_name               = "My Dataset"
  description                 = "This is a dataset for BigQuery"
  location                    = "EU"
}

resource "google_bigquery_table" "table" {
  dataset_id = google_bigquery_dataset.dataset.dataset_id
  table_id   = "my_table"

  schema = file(var.schema_json)
  deletion_protection = false
}

resource "google_bigquery_table" "table_view" {
  dataset_id = google_bigquery_dataset.dataset.dataset_id
  table_id   = "my_view"
  deletion_protection = false

  view {
    query = <<EOF
SELECT tag, SUM(count) as total_count
FROM `${var.project_id}.my_dataset.my_table`
GROUP BY tag
EOF

    use_legacy_sql = false
  }
}
