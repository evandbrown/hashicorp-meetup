provider "google" {
    project = "evandbrown17"
    region = "us-east1"
}

resource "google_pubsub_topic" "default" {
    name = "default-topic"
}
