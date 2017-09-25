output "app_external_ips" {
  value = "${module.app.external_ips}"
}

output "db_external_ip" {
  value = "${module.db.external_ip}"
}

output "db_internal_ip" {
  value = "${module.db.internal_ip}"
}
