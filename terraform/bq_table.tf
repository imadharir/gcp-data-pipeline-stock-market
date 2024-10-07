resource "google_bigquery_table" "table" {
  table_id   = var.bq_table
  dataset_id = google_bigquery_dataset.dataset.dataset_id
  deletion_protection = false
}

output "table_id" {
  value = google_bigquery_table.table.table_id
}