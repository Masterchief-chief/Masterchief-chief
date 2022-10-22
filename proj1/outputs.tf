output "pvt_subnet_id" {
  value       = aws_subnet.private-subnet.id
  description = "Private Subnet ID"
}

output "pub_subnet_id" {
  value       = aws_subnet.public-subnet.id
  description = "Public Subnet ID"
}

output "rds_endpoint" {
  value = aws_db_instance.rds-instance.endpoint
  description = "Endpoint of RDS Instance"
}

output "vpc_id" {
  value       = aws_vpc.vpc.id
  description = "ID of VPC"
}
