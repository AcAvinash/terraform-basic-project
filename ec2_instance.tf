
resource "aws_instance" "my_web_server" {
  ami             = "ami-0cc9838aa7ab1dce7"
  instance_type   = "t2.micro"
  key_name        = "K8s-Keypair"
  security_groups = ["default"]
  tags = {
    Name = "MyWebServer-001"
  }
}