resource "google_compute_network" "hitc-vpc" {
  name                    = "hitc-vpc"
  auto_create_subnetworks = "true"
}

resource "google_compute_firewall" "ssh-server" {
  name    = "default-allow-ssh-terraform"
  network = google_compute_network.hitc-vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  // Allow traffic from everywhere to instances with an ssh-server tag
  source_ranges = ["${chomp(data.http.myip.body)}/32"]
  target_tags   = ["ssh-server"]
}
