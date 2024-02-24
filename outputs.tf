output "key_name" {
  value       = try(tencentcloud_key_pair.imported[0].key_name, tencentcloud_key_pair.generated[0].key_name, "")
  description = "SSH key name"
}

output "public_key" {
  value       = try(tencentcloud_key_pair.imported[0].public_key, tls_private_key.default[0].public_key_openssh, "")
  description = "Content of the generated public key"
}

output "private_key" {
  sensitive   = true
  description = "Content of the generated private key"
  value       = join("", tls_private_key.default.*.private_key_pem)
}

output "public_key_filename" {
  description = "Public Key Filename"

  # Prevent releasing filename to downstream consumers until file exists (aka not during plan):
  value = length(join("", tls_private_key.default.*.public_key_openssh)) > 0 ? local.public_key_filename : local.public_key_filename
}

output "private_key_filename" {
  description = "Private Key Filename"

  # Prevent releasing filename to downstream consumers until file exists (aka not during plan):
  value = length(join("", tls_private_key.default.*.public_key_openssh)) > 0 ? local.private_key_filename : local.private_key_filename
}

output "key_pair_id" {
  description = "SSH key id"
  value       = try(tencentcloud_key_pair.imported[0].id, tencentcloud_key_pair.generated[0].id, "")
}
