# 1. Configure the AWS Provider
provider "aws" {
  region  = "eu-west-1"
  profile = "dev-mfa"
}

# 2. Create a Security Group for the GitHub Runner
resource "aws_security_group" "github_runner_sg" {
  name        = "github-runner-sg"
  description = "Allow SSH access for GitHub self-hosted runner"

  ingress {
    from_port   = 22
    to_port     = 22
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
    Name = "GitHub-Runner-SG"
  }
}

# 3. Create the EC2 Instance for the GitHub Runner
resource "aws_instance" "github_runner" {
  ami           = "ami-04f568a65c2765a88" # Ubuntu 22.04 LTS in eu-west-1
  instance_type = "t3.small"

  vpc_security_group_ids = [aws_security_group.github_runner_sg.id]

  # This script runs automatically on the first boot
  user_data = <<-EOF
              #!/bin/bash
              # Update and install dependencies
              apt-get update
              apt-get install -y curl
              
              # Create a directory for the runner
              mkdir /home/ubuntu/actions-runner
              cd /home/ubuntu/actions-runner
              
              # Download the runner package
              curl -o actions-runner-linux-x64-2.328.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.328.0/actions-runner-linux-x64-2.328.0.tar.gz
              
              # Extract the installer
              tar xzf ./actions-runner-linux-x64-2.328.0.tar.gz
              
              # Change ownership to the ubuntu user
              chown -R ubuntu:ubuntu /home/ubuntu/actions-runner
              
              # Configure the runner as the ubuntu user
              sudo -u ubuntu ./config.sh --url https://github.com/DarkSim-source/DevOpsHive --token BWO5FAWBZWOJBV73S2Q7I73IVTKHO --unattended --replace
              
              # Install and start the runner as a service
              ./svc.sh install
              ./svc.sh start
              EOF

  tags = {
    Name = "GitHub-Runner"
  }
}
