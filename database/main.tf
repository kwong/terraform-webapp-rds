# database/main.tf

resource "aws_db_instance" "main_db" {
  allocated_storage      = 10
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t2.micro"
  name                   = var.dbname
  username               = var.dbuser
  password               = var.dbpassword
  identifier             = "main-db"
  skip_final_snapshot    = true
  db_subnet_group_name   = var.db_subnet_group_name
  vpc_security_group_ids = var.vpc_security_group_ids
}