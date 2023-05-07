# Terraform Modules for Guance Cloud Monitor

![cover](https://raw.githubusercontent.com/GuanceCloud/terraform-guance-dashboard/5a497e43d5250cd92d1430b25ba9d4f33cea5e2b/artwork/cover.png)

Monitor is a module that creates an Monitor in Guance Cloud. It contains a set of built-in monitors that are designed to provide a quick alerting of your infrastructure.

## Usage

```terraform
terraform {
  required_version = ">= 1.0"

  required_providers {
    guance = {
      source  = "GuanceCloud/guance"
      version = "0.0.4"
    }
  }
}

provider "guance" {
}

variable "email" {
  type = string
}

data "guance_members" "demo" {
  filters = [
    {
      name   = "email"
      values = [var.email]
    }
  ]
}

resource "guance_membergroup" "demo" {
  name       = "oac-demo"
  member_ids = data.guance_members.demo.items[*].id
}

resource "guance_alertpolicy" "demo" {
  name           = "oac-demo"
  silent_timeout = "1h"

  statuses = [
    "critical",
    "error",
    "warning",
    "info",
    "ok",
    "nodata",
    "nodata_ok",
    "nodata_as_ok",
  ]

  alert_targets = [
    {
      type = "member_group"
      member_group = {
        id = guance_membergroup.demo.id
      }
    },
  ]
}

module "aerospike" {
  source  = "GuanceCloud/monitor/guance//modules/aerospike"
  version         = "0.0.1"
  alert_policy_id = guance_alertpolicy.demo.id
}
```

Aerospike is one of the submodule in this repository.

Use the submodules dropdown in [Hashicorp Registry](https://registry.terraform.io/modules/GuanceCloud/dashboard/guance/latest) to view the 156 submodules defined within this module.

## Feedback

If you have any feedback, please create an issue or a pull request.

## Contributing

If you wish to contribute to this repository, please fork it and send us a pull request.

This [Contribution Guidelines](https://guance.io/contribution-guide/) document contains more detailed information about contributing to this repository.

## License

This repository is licensed under the [Apache 2.0 License](./LICENSE).

