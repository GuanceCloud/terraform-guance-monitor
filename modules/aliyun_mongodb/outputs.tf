output "monitor_ids" {
  description = "The `guance_monitor`'s id."
  value = [
    guance_monitor.main_001.id,
    guance_monitor.main_002.id,
    guance_monitor.main_003.id,
    guance_monitor.main_004.id,
    guance_monitor.main_005.id,
  ]
}