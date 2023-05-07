
resource "guance_monitor" "main_001" {
  manifest = file("${path.module}/manifest-001.json")

  alert_policy = var.alert_policy_id == null ? null : {
    id = var.alert_policy_id
  }

  dashboard = var.dashboard_id == null ? null : {
    id = var.dashboard_id
  }
}

resource "guance_monitor" "main_002" {
  manifest = file("${path.module}/manifest-002.json")

  alert_policy = var.alert_policy_id == null ? null : {
    id = var.alert_policy_id
  }

  dashboard = var.dashboard_id == null ? null : {
    id = var.dashboard_id
  }
}

resource "guance_monitor" "main_003" {
  manifest = file("${path.module}/manifest-003.json")

  alert_policy = var.alert_policy_id == null ? null : {
    id = var.alert_policy_id
  }

  dashboard = var.dashboard_id == null ? null : {
    id = var.dashboard_id
  }
}

resource "guance_monitor" "main_004" {
  manifest = file("${path.module}/manifest-004.json")

  alert_policy = var.alert_policy_id == null ? null : {
    id = var.alert_policy_id
  }

  dashboard = var.dashboard_id == null ? null : {
    id = var.dashboard_id
  }
}

resource "guance_monitor" "main_005" {
  manifest = file("${path.module}/manifest-005.json")

  alert_policy = var.alert_policy_id == null ? null : {
    id = var.alert_policy_id
  }

  dashboard = var.dashboard_id == null ? null : {
    id = var.dashboard_id
  }
}

resource "guance_monitor" "main_006" {
  manifest = file("${path.module}/manifest-006.json")

  alert_policy = var.alert_policy_id == null ? null : {
    id = var.alert_policy_id
  }

  dashboard = var.dashboard_id == null ? null : {
    id = var.dashboard_id
  }
}

resource "guance_monitor" "main_007" {
  manifest = file("${path.module}/manifest-007.json")

  alert_policy = var.alert_policy_id == null ? null : {
    id = var.alert_policy_id
  }

  dashboard = var.dashboard_id == null ? null : {
    id = var.dashboard_id
  }
}

resource "guance_monitor" "main_008" {
  manifest = file("${path.module}/manifest-008.json")

  alert_policy = var.alert_policy_id == null ? null : {
    id = var.alert_policy_id
  }

  dashboard = var.dashboard_id == null ? null : {
    id = var.dashboard_id
  }
}

resource "guance_monitor" "main_009" {
  manifest = file("${path.module}/manifest-009.json")

  alert_policy = var.alert_policy_id == null ? null : {
    id = var.alert_policy_id
  }

  dashboard = var.dashboard_id == null ? null : {
    id = var.dashboard_id
  }
}

