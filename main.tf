# root/main.tf

## network

module "networking" {
  source           = "./networking"
  vpc_cidr         = "10.0.0.0/16"
  public_sn_count  = 3
  private_sn_count = 2
  public_cidrs     = ["10.0.1.0/24", "10.0.3.0/24", "10.0.5.0/24"]
  private_cidrs    = ["10.0.2.0/24", "10.0.4.0/24", "10.0.6.0/24"]
  max_subnets      = 3
  security_groups  = local.security_groups
}

module "database" {
  source                 = "./database"
  dbname                 = var.dbname
  dbuser                 = var.dbuser
  dbpassword             = var.dbpassword
  db_subnet_group_name   = module.networking.db_subnet_group_name[0]
  vpc_security_group_ids = [module.networking.db_security_group]
}