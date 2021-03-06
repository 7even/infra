resource "google_compute_instance" "app" {
  name         = "reddit-app-${count.index + 1}"
  machine_type = "g1-small"
  zone         = "europe-west1-b"
  tags         = ["reddit-app", "http-server"]
  count        = "${var.instances_count}"

  boot_disk {
    initialize_params {
      image = "${var.app_disk_image}"
    }
  }

  network_interface {
    network       = "default"
    access_config = {}
  }

  metadata {
    sshKeys = "appuser:${file(var.public_key_path)}"
  }
}

resource "google_compute_firewall" "firewall_puma" {
  name    = "allow-puma-default"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["9292"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["reddit-app"]
}
