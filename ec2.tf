// ec2 servers
resource "aws_instance" "server1" {
  instance_type          = "t2.micro"
  ami                    = "ami-0c55b159cbfafe1f0" // Example AMI ID
  user_data              = file("setup.sh")
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  subnet_id              = aws_subnet.private1.id // replace with your subnet ID  

  tags = {
    Name = "WebServer1"
    Env  = "dev"
  }
}

resource "aws_instance" "server2" {
  instance_type          = "t2.micro"
  ami                    = "ami-0c55b159cbfafe1f0" // Example AMI ID
  user_data              = file("setup.sh")
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  subnet_id              = aws_subnet.private2.id // replace with your subnet ID  

  tags = {
    Name = "WebServer2"
    Env  = "dev"
  }
}