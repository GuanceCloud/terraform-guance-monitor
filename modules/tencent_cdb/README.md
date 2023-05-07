<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_guance"></a> [guance](#provider\_guance) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [guance_monitor.main_001](https://registry.terraform.io/providers/GuanceCloud/guance/latest/docs/resources/monitor) | resource |
| [guance_monitor.main_002](https://registry.terraform.io/providers/GuanceCloud/guance/latest/docs/resources/monitor) | resource |
| [guance_monitor.main_003](https://registry.terraform.io/providers/GuanceCloud/guance/latest/docs/resources/monitor) | resource |
| [guance_monitor.main_004](https://registry.terraform.io/providers/GuanceCloud/guance/latest/docs/resources/monitor) | resource |
| [guance_monitor.main_005](https://registry.terraform.io/providers/GuanceCloud/guance/latest/docs/resources/monitor) | resource |
| [guance_monitor.main_006](https://registry.terraform.io/providers/GuanceCloud/guance/latest/docs/resources/monitor) | resource |
| [guance_monitor.main_007](https://registry.terraform.io/providers/GuanceCloud/guance/latest/docs/resources/monitor) | resource |
| [guance_monitor.main_008](https://registry.terraform.io/providers/GuanceCloud/guance/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alert_policy_id"></a> [alert\_policy\_id](#input\_alert\_policy\_id) | (Optional) The Alert Policy ID for taking effect when the alert is triggered. | `string` | `null` | no |
| <a name="input_dashboard_id"></a> [dashboard\_id](#input\_dashboard\_id) | (Optional) The Dashboard ID for linking to the report of monitoring. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_monitor_ids"></a> [monitor\_ids](#output\_monitor\_ids) | The `guance_monitor`'s id. |
<!-- END_TF_DOCS -->