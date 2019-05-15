variable "region"{
    default = "us-west2"
}
variable "zone"{
    default = "us-west2-a"
}

variable "machine_type"
{
    default="f1-micro"
}

provider "google"{
    project = "udemy-gcp-ace"
    credentials = "../udemy-gcp-ace-a79050c440bc.json"
    region = "${var.region}"
    zone = "${var.zone}"
}

resource "google_compute_instance" "default" {
  name         = "test"
  machine_type = "${var.machine_type}"
  zone         = "${var.zone}"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
        access_config {
      // Ephemeral IP
    }
  }


  metadata_startup_script = <<SCRIPT
curl https://raw.githubusercontent.com/ACloudGuru/gcp-cloud-engineer/master/compute-labs/worker-startup-script.sh | bashSCRIPT

}

