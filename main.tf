# https://github.com/ACloudGuru-Resources/content-hashicorp-certified-terraform-associate-foundations.git

provider "aws" {
  region = "us-east-1"
}

# Key Pair
resource "aws_key_pair" "deployer" {
  key_name   = "provision_key"
  public_key = file("~/.ssh/id_rsa.pub")
}


data "aws_ssm_parameter" "ami_id" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "vpc_webserver"
  cidr = var.vpc_cidr

  azs            = ["us-east-1a"]
  public_subnets = ["10.0.1.0/24"]
}

resource "aws_security_group" "sg_ws" {
  vpc_id = module.vpc.vpc_id
  name   = join("_", ["sg", module.vpc.vpc_id])
  dynamic "ingress" {
    for_each = var.rules
    content {
      from_port   = ingress.value["port"]
      to_port     = ingress.value["port"]
      protocol    = ingress.value["proto"]
      cidr_blocks = ingress.value["cidr_blocks"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = "sg_webserver"
  }
}


resource "aws_instance" "apache_ws" {
  ami                         = data.aws_ssm_parameter.ami_id.value
  subnet_id                   = module.vpc.public_subnets[0]
  instance_type               = var.instance_type
  security_groups             = [aws_security_group.sg_ws.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.deployer.key_name
  user_data                   = fileexists("files/apache_install.sh") ? file("files/apache_install.sh") : null

}