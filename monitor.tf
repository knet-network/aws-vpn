resource "aws_cloudwatch_metric_alarm" "vpn" {

	comparison_operator = "LessThanOrEqualToThreshold"
	evaluation_periods  = "10"
	metric_name         = "NetworkPacketsIn"
	namespace           = "AWS/EC2"
	period              = "300"
	statistic           = "Average"
	threshold           = "10"

	alarm_name                = "vpn_low_traffic"
	alarm_description         = "This metric monitors ec2 network packets in"
	alarm_actions             = [
		"arn:aws:swf:${var.region}:${data.aws_caller_identity.current.account_id}:action/actions/AWS_EC2.InstanceId.Terminate/1.0"
	]

	insufficient_data_actions = [
		"arn:aws:swf:${var.region}:${data.aws_caller_identity.current.account_id}:action/actions/AWS_EC2.InstanceId.Terminate/1.0"
	]

	dimensions {
		InstanceId = "${aws_instance.server_vpn.id}"
	}
}