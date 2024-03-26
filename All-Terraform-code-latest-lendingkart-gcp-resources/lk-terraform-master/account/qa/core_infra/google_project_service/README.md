<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.5.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 4.81.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_google_project_service"></a> [google\_project\_service](#module\_google\_project\_service) | ../../../../modules/google_project_service | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_disable_dependent_services"></a> [disable\_dependent\_services](#input\_disable\_dependent\_services) | Boolean value to decide whether enable or disable project service during destroy | `bool` | `true` | no |
| <a name="input_disable_on_destroy"></a> [disable\_on\_destroy](#input\_disable\_on\_destroy) | Boolean value to decide whether enable or disable project service during destroy | `bool` | `true` | no |
| <a name="input_enable_apis"></a> [enable\_apis](#input\_enable\_apis) | Actually enable the APIs listed | `bool` | `true` | no |
| <a name="input_env"></a> [env](#input\_env) | Resource description | `string` | n/a | yes |
| <a name="input_list_activate_apis"></a> [list\_activate\_apis](#input\_list\_activate\_apis) | List of APIs that needs to be enabled | `list(string)` | <pre>[<br>  "iam.googleapis.com"<br>]</pre> | no |
| <a name="input_project"></a> [project](#input\_project) | Name of the project | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | ID of the project | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region where the resource needs to be created | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->

## Deployment commands

```bash
$:~/lk-terraform/account/qa/core_infra/google_project_service$ terraform init

Initializing the backend...

Successfully configured the backend "gcs"! Terraform will automatically
use this backend unless the backend configuration changes.
Initializing modules...
- google_project_service in ../../../../modules/google_project_service

Initializing provider plugins...
- Finding hashicorp/google versions matching "~> 4.81.0"...
- Installing hashicorp/google v4.81.0...
- Installed hashicorp/google v4.81.0 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

```bash
$:~/lk-terraform/account/qa/core_infra/google_project_service$ terraform plan -var-file=../../../tfvars/qa.tfvars

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.google_project_service.google_project_service.google_project_service["iam.googleapis.com"] will be created
  + resource "google_project_service" "google_project_service" {
      + disable_dependent_services = true
      + disable_on_destroy         = true
      + id                         = (known after apply)
      + project                    = "lk-qa-apps"
      + service                    = "iam.googleapis.com"

      + timeouts {
          + create = "30m"
          + delete = "30m"
          + read   = "10m"
          + update = "30m"
        }
    }


Plan: 1 to add, 0 to change, 0 to destroy.
╷
│ Warning: Value for undeclared variable
│ 
│ The root module does not declare a variable named "region_code" but a value was found in file "../../../tfvars/qa.tfvars". If you meant to
│ use this value, add a "variable" block to the configuration.
│ 
│ To silence these warnings, use TF_VAR_... environment variables to provide certain "global" settings to all configurations in your
│ organization. To reduce the verbosity of these warnings, use the -compact-warnings option.
╵
╷
│ Warning: Value for undeclared variable
│ 
│ The root module does not declare a variable named "zones" but a value was found in file "../../../tfvars/qa.tfvars". If you meant to use
│ this value, add a "variable" block to the configuration.
│ 
│ To silence these warnings, use TF_VAR_... environment variables to provide certain "global" settings to all configurations in your
│ organization. To reduce the verbosity of these warnings, use the -compact-warnings option.
╵
╷
│ Warning: Values for undeclared variables
│ 
│ In addition to the other similar warnings shown, 5 other variable(s) defined without being declared.
╵

─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform
apply" now.
```

## terraform-docs command

```bash
$:~/lk-terraform/account/qa/core_infra/google_project_service$ terraform-docs markdown table --output-file README.md --output-mode inject .
README.md updated successfully
```