#####################################################################################
#                                   Add Key Pair
####################################################################################

resource "aws_key_pair" "iacapps-es-admin1" {
  key_name = "${var.key_name}"
  public_key = "${file(var.public_key_path)}"
}

module "modules" {
  source = "./modules"

  name           = "my-cluster"
  instance_count = 5

  ami                    = "mi-26ebbc5c"
  instance_type          = "t2.micro"
  key_name               = "iacapps-es-admin1"
  monitoring             = false
  vpc_security_group_ids = ["sg-29e26b5d", "sg-c1fb72b5"]
  subnet_id              = "subnet-2d104b66"

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
