variable "region" {
  type        = string
  description = "Tencent Cloud region"
}

variable "key_name" {
  type    = string
  default = "SSH Key name"
}

variable "ssh_public_key_path" {
  type        = string
  description = "Path to SSH public key directory (e.g. `/secrets`)"
}

variable "generate_ssh_key" {
  type        = bool
  description = "If set to `true`, new SSH key pair will be created"
}
