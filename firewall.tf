resource "google_compute_firewall" "www" {
    name = "www"
    network = "${google_compute_network.default.name}"

    allow {
        protocol = "tcp"
        ports = ["80", "443"]
    }

    target_tags = ["www"]
    source_ranges = ["0.0.0.0/0"]
}
