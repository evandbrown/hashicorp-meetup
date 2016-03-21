resource "google_compute_network" "default" {
    name = "prod"
}

resource "google_compute_subnetwork" "default-us-east1" {
    name = "default-us-east1"
    ip_cidr_range = "10.0.0.0/16"
    network = "${google_compute_network.default.self_link}"
    region = "us-east1"
}
