locals {
  public_key_filename = format(
    "%s/%s",
    var.ssh_public_key_path,
    coalesce(var.ssh_public_key_file, join("", [var.key_name, var.public_key_extension]))
  )

  private_key_filename = format(
    "%s/%s%s",
    var.ssh_public_key_path,
    var.key_name,
    var.private_key_extension
  )
}

resource "tencentcloud_key_pair" "imported" {
  count = var.enabled && var.generate_ssh_key == false ? 1 : 0
  # TencentCloud key_name only support letters, numbers and "_"
  key_name   = replace(var.key_name, "-", "_")
  public_key = file(local.public_key_filename)
}

resource "tls_private_key" "default" {
  count     = var.enabled && var.generate_ssh_key == true ? 1 : 0
  algorithm = var.ssh_key_algorithm
}


resource "tencentcloud_key_pair" "generated" {
  count      = var.enabled && var.generate_ssh_key == true ? 1 : 0
  depends_on = [tls_private_key.default]
  # TencentCloud key_name only support letters, numbers and "_"
  key_name   = replace(var.key_name, "-", "_")
  public_key = tls_private_key.default[0].public_key_openssh
}

resource "local_file" "public_key_openssh" {
  count      = var.enabled && var.generate_ssh_key == true ? 1 : 0
  depends_on = [tls_private_key.default]
  content    = tls_private_key.default[0].public_key_openssh
  filename   = local.public_key_filename
}

resource "local_sensitive_file" "private_key_pem" {
  count           = var.enabled && var.generate_ssh_key == true ? 1 : 0
  depends_on      = [tls_private_key.default]
  content         = tls_private_key.default[0].private_key_pem
  filename        = local.private_key_filename
  file_permission = "0600"
}
