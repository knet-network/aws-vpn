terraform {
	required_version = ">= 0.11.13"

#	backend "s3" {
#		bucket = "xxx"
#		key    = "vpn/"
#		region = "eu-central-1"
#	}
}

provider "aws" {
	region = "${var.region}"
}

data "aws_caller_identity" "current" {}

module "keypair" {
	source = "mitchellh/dynamic-keys/aws"

	name = "vpn"

	path = "${path.root}/keys"
}
