module "app_credentials_folder_default" {
  source = "../../../modules/vault/application_folder"
  application_path = "credentials/${var.env}/${var.appname}/default/"
}

module "app_credentials_folder_red" {
  source = "../../../modules/vault/application_folder"
  application_path = "credentials/${var.env}/${var.appname}/red/"
}

module "app_credentials_folder_blue" {
  source = "../../../modules/vault/application_folder"
  application_path = "credentials/${var.env}/${var.appname}/blue/"
}

module "app_credentials_folder_green" {
  source = "../../../modules/vault/application_folder"
  application_path = "credentials/${var.env}/${var.appname}/green/"
}

module "app_parameters_folder_default" {
  source = "../../../modules/vault/application_folder"
  application_path = "parameters/${var.env}/${var.appname}/default/"
}

module "app_parameters_folder_red" {
  source = "../../../modules/vault/application_folder"
  application_path = "parameters/${var.env}/${var.appname}/red/"
}

module "app_parameters_folder_blue" {
  source = "../../../modules/vault/application_folder"
  application_path = "parameters/${var.env}/${var.appname}/blue/"
}

module "app_parameters_folder_green" {
  source = "../../../modules/vault/application_folder"
  application_path = "parameters/${var.env}/${var.appname}/green/"
}