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
  source          = "GuanceCloud/monitor/guance//modules/aerospike"
  version         = "0.0.2"
  alert_policy_id = guance_alertpolicy.demo.id
}

