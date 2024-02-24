provider "tencentcloud" {
  region = var.region
}

module "key_pair" {
  source = "../../"

  key_name            = var.key_name
  ssh_public_key_path = var.ssh_public_key_path
  generate_ssh_key    = var.generate_ssh_key

}
