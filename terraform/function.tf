resource "google_cloudfunctions_function" "streaming_function" {
  name        = "streamingFunction"
  runtime     = "python310"  # Runtime
  entry_point = "streaming"  # The main function to run

  source_archive_bucket = google_storage_bucket.function_bucket.name
  source_archive_object = google_storage_bucket_object.function_zip.name  
  event_trigger {
    event_type = "google.storage.object.finalize"  
    resource   = google_storage_bucket.bucket.name
  }

  environment_variables = {
    GOOGLE_FUNCTION_SOURCE = "main.py"
    PROJECT_ID = "${var.project_id}"
    BQ_DATASET = "${var.bq_dataset}"
    BQ_TABLE   = "${var.bq_table}"
  }
}