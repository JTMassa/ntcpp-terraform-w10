// creation of security group

resource "aws_security_group" "alb_sg" {
  name        = "alb-sg"
  description = "Security group with por 80 open"
  vpc_id      = aws_vpc.my_vpc.id # replace with your VPC ID

  # HTTP
  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  # Outbound - allow all
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "alb-sg"
  }
}

// creation of security group

resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Security group with por 80 open"
  vpc_id      = aws_vpc.my_vpc.id # replace with your VPC ID

  # HTTP
  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    //cidr_blocks = ["0.0.0.0/0"]
    security_groups = [aws_security_group.alb_sg.id] // allow only from ALB SG
  }


  # Outbound - allow all
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-sg"
  }
}