output "app_external_ips" {
  value = "${module.app.external_ips}"
}

output "db_external_ip" {
  value = "${module.db.external_ip}"
}
