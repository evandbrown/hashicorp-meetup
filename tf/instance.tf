resource "google_compute_instance" "default" {
    name = "hug-demo"
    machine_type = "n1-standard-1"
    zone = "us-central1-f"
    tags = ["www"]

    disk {
        image = "myapp-1458614153"
    }

    // Local SSD disk
    disk {
        type = "local-ssd"
        scratch = true
    }

    network_interface {
        network = "${google_compute_network.default.name}"
        access_config {
        }
    }

    metadata_startup_script = "/usr/local/bin/app"
}

resource "google_compute_firewall" "www-demo" {
    name = "www-demo"
    network = "default"

    allow {
        protocol = "tcp"
        ports = ["8080"]
    }

    target_tags = ["www"]
    source_ranges = ["0.0.0.0/0"]
}
