# terraform-tencentcloud-keypair

## Example

```hcl
module "keypair" {
  source = "github.com/wootile/terraform-tencentcloud-keypair"

  key_name            = "chenming_mbp"
  ssh_public_key_path = "./secrets"
  generate_ssh_key    = true
}

provider "tencentcloud" {
  region = "ap-guangzhou"
}

terraform {
  required_providers {
    tencentcloud = {
      source  = "tencentcloudstack/tencentcloud"
      version = ">= 1.81"
    }
  }
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_tencentcloud"></a> [tencentcloud](#requirement\_tencentcloud) | >= 1.67.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_local"></a> [local](#provider\_local) | n/a |
| <a name="provider_tencentcloud"></a> [tencentcloud](#provider\_tencentcloud) | >= 1.67.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [local_file.public_key_openssh](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [local_sensitive_file.private_key_pem](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/sensitive_file) | resource |
| [tencentcloud_key_pair.generated](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/key_pair) | resource |
| [tencentcloud_key_pair.imported](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/key_pair) | resource |
| [tls_private_key.default](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Set to false to prevent the module from creating any resources. | `bool` | `true` | no |
| <a name="input_generate_ssh_key"></a> [generate\_ssh\_key](#input\_generate\_ssh\_key) | If set to `true`, new SSH key pair will be created and `ssh_public_key_file` will be ignored | `bool` | `false` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | SSH Key name, only support letters, numbers and "\_" | `string` | n/a | yes |
| <a name="input_private_key_extension"></a> [private\_key\_extension](#input\_private\_key\_extension) | Private key extension | `string` | `""` | no |
| <a name="input_public_key_extension"></a> [public\_key\_extension](#input\_public\_key\_extension) | Public key extension | `string` | `".pub"` | no |
| <a name="input_ssh_key_algorithm"></a> [ssh\_key\_algorithm](#input\_ssh\_key\_algorithm) | SSH key algorithm | `string` | `"RSA"` | no |
| <a name="input_ssh_public_key_file"></a> [ssh\_public\_key\_file](#input\_ssh\_public\_key\_file) | Name of existing SSH public key file (e.g. `id_rsa.pub`) | `string` | `null` | no |
| <a name="input_ssh_public_key_path"></a> [ssh\_public\_key\_path](#input\_ssh\_public\_key\_path) | Path to SSH public key directory (e.g. `./secrets`) | `string` | `"./secrets"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_key_name"></a> [key\_name](#output\_key\_name) | SSH key name |
| <a name="output_key_pair_id"></a> [key\_pair\_id](#output\_key\_pair\_id) | SSH key id |
| <a name="output_private_key"></a> [private\_key](#output\_private\_key) | Content of the generated private key |
| <a name="output_private_key_filename"></a> [private\_key\_filename](#output\_private\_key\_filename) | Private Key Filename |
| <a name="output_public_key"></a> [public\_key](#output\_public\_key) | Content of the generated public key |
| <a name="output_public_key_filename"></a> [public\_key\_filename](#output\_public\_key\_filename) | Public Key Filename |
<!-- END_TF_DOCS -->