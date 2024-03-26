output "mysql_db_name" {
  value = google_sql_database_instance.mysql_instance.name
}

output "mysql_db_ip_address" {
  value = google_sql_database_instance.mysql_instance.ip_address
}