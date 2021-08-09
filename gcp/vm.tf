resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-focal-v20210415"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.self_link
    access_config {
      nat_ip = google_compute_address.static.address
      }
  }

  metadata = {
    sshKeys = "${var.ssh_user}:${file(var.ssh_pub_key_file)}"
    }

  # metadata_startup_script = file("workstation1.sh")

  tags = ["ssh-server"]

}
