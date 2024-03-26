module "app_credentials_folder_default" {
  source = "../../../modules/vault/application_folder"
  application_path = "credentials/${var.env}/${var.appname}/default/"
}

module "app_parameters_folder_default" {
  source = "../../../modules/vault/application_folder"
  application_path = "parameters/${var.env}/${var.appname}/default/"
}