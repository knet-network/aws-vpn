output "domain" {
	value = "${aws_route53_record.vpn.fqdn}"
}

output "authorized_ips" {
	value = "${var.authorized_ips_range}"
}
