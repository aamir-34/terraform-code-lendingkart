output "gcs_name_aggregated_logs" {
  value = module.gcs_aggregated_logs.gcs_name
}

output "gcs_name_audit" {
  value = module.gcs_audit.gcs_name
}
