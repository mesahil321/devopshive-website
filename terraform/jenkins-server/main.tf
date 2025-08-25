# 1. Configure the AWS Provider to use your MFA profile
provider "aws" {
  region  = "eu-west-1"
  profile = "dev-mfa"
}

# 2. Create a Security Group for the Jenkins Server
resource "aws_security_group" "jenkins_sg" {
  name        = "jenkins-server-sg"
  description = "Allow SSH and HTTP access for Jenkins"

  ingress {
    description = "Allow SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow access to Jenkins dashboard"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Jenkins-Server-SG"
  }
}

# 3. Create the EC2 Instance for the Jenkins Server
resource "aws_instance" "jenkins_server" {
  # An Ubuntu 22.04 LTS AMI in eu-west-1
  ami           = "ami-04f568a65c2765a88"
  instance_type = "t2.micro"

  # Attach the security group created above
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]

  # Use the variable for the Name tag
  tags = {
    Name = var.instance_name
  }
}
