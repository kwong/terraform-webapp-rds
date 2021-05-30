output "db_subnet_group_name" {
  value = aws_db_subnet_group.db_sn_group[*].name
}

output "db_security_group" {
  value = aws_security_group.sg["rds"].id
}