output "vpc_id" {
  description = "ID of VPC"
  value       = resource.aws_vpc.main.id
  sensitive = false
}