provider "google" {
    project = var.project_id
    region  = var.region
    credentials = "../stockmarketrealtimedataanalysi-0a3e4599e01f.json"
}