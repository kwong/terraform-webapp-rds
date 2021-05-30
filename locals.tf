locals {
  security_groups = {
    public = {
      name        = "public_sg"
      description = "public access"
      ingress = {
        http = {
          from        = 80
          to          = 80
          protocol    = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
        }
      }
    }
  }
}
