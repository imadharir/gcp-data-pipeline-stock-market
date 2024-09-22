resource "google_storage_bucket" "bucket" {
  name     = var.bucket_name
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



output "bucket_name" {
  value = google_storage_bucket.bucket.name
}