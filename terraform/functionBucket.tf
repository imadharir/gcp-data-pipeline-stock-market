resource "google_storage_bucket" "function_bucket" {
  name     = var.function_bucket_name
  force_destroy = true
  location = var.region

  versioning {
    enabled = true
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 30
    }
  }
}

resource "google_storage_bucket_object" "function_zip" {
  name   = "function-source.zip"
  bucket = google_storage_bucket.function_bucket.name
  source = "function-source.zip"  # Path to the local zip file
}



