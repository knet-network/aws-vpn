variable "region" {
	type    = "string"
	default = "us-east-2"
}

variable "authorized_ips_range" {
	type = "list"

	default = [
		"0.0.0.0/0",
	]
}

variable "vpc_cidr_block" {
	type    = "string"
	default = "192.168.171.0/24"
}

variable "ubuntu_version" {
	type    = "string"
	default = "bionic-18.04"
}

variable "domain" {
	type    = "string"
}
variable "subdomain" {
	type    = "string"
	default = "vpn"
}