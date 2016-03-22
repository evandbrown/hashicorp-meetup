resource "google_compute_instance" "default" {
    name = "hug-demo"
    machine_type = "n1-standard-1"
    zone = "us-central1-f"
    tags = ["www"]

    disk {
        image = "myapp-12dd23e"
    }

    // Local SSD disk
    disk {
        type = "local-ssd"
        scratch = "true"
    }

    network_interface {
        network = "default"
        access_config {
            // Ephemeral IP
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
