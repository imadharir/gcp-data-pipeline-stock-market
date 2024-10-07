resource "google_bigquery_dataset" "dataset" {
  dataset_id = var.bq_dataset
  location   = var.region

  # This ensures tables are deleted when the dataset is destroyed
  #delete_contents_on_destroy = true
}

resource "google_bigquery_dataset" "dbt_dataset" {
  dataset_id = "dbt_dataset"
  location   = var.region

  # This ensures tables are deleted when the dataset is destroyed
  #delete_contents_on_destroy = true
}

output "dataset_id" {
  value = google_bigquery_dataset.dataset.dataset_id
}