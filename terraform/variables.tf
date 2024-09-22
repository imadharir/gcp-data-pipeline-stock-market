variable "project_id" {
  type        = string
  description = "The google cloud project id"
}

variable "region" {
  type        = string
  description = "The google cloud region"
  default     = "us-central1"
}

variable "topic_name" {
    type        = string
    description = "The name of the pubsub topic"
}

variable "subscription_name" {
    type        = string
    description = "The name of the pubsub subscription"
}

variable "zone" {
    type        = string
    description = "The google cloud zone"
    default     = "us-central1-a"
}

variable "bucket_name" {
  description = "The name of the GCS bucket"
  type        = string
}

variable "function_bucket_name" {
  description = "The name of the GCS bucket for the function (json files from GCS bucket  to BQ)"
  type        = string
}

variable "bq_dataset" {
  description = "The name of the BigQuery dataset"
  type        = string
}

variable "bq_table" {
  description = "The name of the BigQuery table"
  type        = string
}