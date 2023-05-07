output "ec2_id" {
  description = "ID"
  value       = concat(aws_instance.instance.*.id, [""])[0]
}

output "target_arn" {
  description = "arn"
  value       = concat(aws_instance.instance.*.arn, [""])[0]
}