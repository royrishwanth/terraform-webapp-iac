resource "aws_key_pair" "web-key-pair" {
  key_name   = "demo-web-key"
  public_key = file(var.key_path)

  tags = {
    Name = "demo-web-key-pair"

  }
}

resource "aws_security_group" "web-sg" {
  name        = "web-sg"
  description = "Allow HTTP and SSH traffic"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

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
    Name = "demo-web-sg"
  }
}

resource "aws_instance" "web-server-1" {
  ami             = var.ami_id # Replace with a valid AMI ID
  instance_type   = var.instance_type
  subnet_id       = var.private_subnet_ids[0] # Use the first private subnet
  key_name        = aws_key_pair.web-key-pair.key_name
  security_groups = [aws_security_group.web-sg.id]
  user_data       = var.user_data_1

  tags = {
    Name = "demo-web-server-1"
  }
}

resource "aws_instance" "web-server-2" {
  ami             = var.ami_id # Replace with a valid AMI ID
  instance_type   = var.instance_type
  subnet_id       = var.private_subnet_ids[1] # Use the second private subnet
  key_name        = aws_key_pair.web-key-pair.key_name
  security_groups = [aws_security_group.web-sg.id]
  user_data       = var.user_data_2

  tags = {
    Name = "demo-web-server-2"
  }

}
