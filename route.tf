data "aws_route53_zone" "selected" {
	name         = "${var.domain}."
	#private_zone = true
}

resource "aws_route53_record" "vpn" {
	zone_id = "${data.aws_route53_zone.selected.zone_id}"
	name    = "${var.subdomain}.${data.aws_route53_zone.selected.name}"
	type    = "A"
	ttl     = "60"
	records = [ "${aws_instance.server_vpn.public_ip}" ]
}