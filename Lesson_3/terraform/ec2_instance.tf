resource "aws_security_group" "my_web_server" {
  description = "Ssh access to my web server"
  name        = "my-web-server-access"
  vpc_id      = var.vpc

  ingress {
    description = "Allow IN ssh from internet"
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow IN Http from internet"
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
    description = "Allow IN Https from internet"
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow OUT ssh"
    protocol  = "tcp"
    from_port = 22
    to_port   = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

    egress {
    description = "Allow OUT http"
    protocol  = "tcp"
    from_port = 80
    to_port   = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow OUT https"
    protocol  = "tcp"
    from_port = 443
    to_port   = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

 tags = {
     Name = "my-web-server-access"
     Env = "Demo"
 }
}

resource "aws_instance" "my_web_server" {
  ami           = var.my_web_server_ami_id
  instance_type = var.my_web_server_instance_type
  subnet_id     = var.subnet_a
  key_name      = var.my_web_server_key_name
  iam_instance_profile   = aws_iam_instance_profile.s3_read_access.name
  vpc_security_group_ids = [aws_security_group.my_web_server.id]

  user_data = <<EOF
#!/bin/bash
aws s3 cp s3://aws-developer-fundamentals-bucket/simple_small_file.txt /home/ec2-user/simple_small_file.txt
EOF



root_block_device {
      volume_size           = var.my_web_server_root_volume_size
      volume_type           = var.my_web_server_root_volume_type
      delete_on_termination = "true"

      tags = {
        Name = "my-web-server-access"
        Env = "Demo"
      }
    }

tags = {
    Name = "my-web-server-access"
    Env = "Demo"
    }
}
