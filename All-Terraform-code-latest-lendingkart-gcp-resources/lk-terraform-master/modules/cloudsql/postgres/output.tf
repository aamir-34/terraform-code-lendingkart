output "db_name" {
  value = google_sql_database_instance.sql_instance.name
}

output "db_ip_address" {
  value = google_sql_database_instance.sql_instance.ip_address
}
