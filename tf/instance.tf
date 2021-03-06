resource "google_compute_instance" "default" {
    name = "hug"
    machine_type = "n1-standard-1"
    zone = "us-central1-f"
    tags = ["www", "demo"]
 
    disk {
        image = "myapp-12dd23e"
    }

    // Local SSD disk
    disk {
        type = "local-ssd"
        scratch = true
    }

    network_interface {
        subnetwork = "${google_compute_subnetwork.default-us-central1.name}"
        access_config {
        }
    }

    metadata_startup_script = "/usr/local/bin/app"
}
