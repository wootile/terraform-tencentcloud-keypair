### Define the application aws provider

### Define terraform version and required providers
terraform {
  required_version = ">= 1.0"
  required_providers {
    tencentcloud = {
      source  = "tencentcloudstack/tencentcloud"
      version = ">= 1.67.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = ">= 2.0"
    }
    local = {
      source  = "hashicorp/local"
      version = ">= 2.2.1"
    }
    null = {
      source  = "hashicorp/null"
      version = ">= 2.1"
    }
  }
}
