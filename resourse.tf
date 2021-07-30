resource "aws_instance" "aws" {
  ami           = "ami-0194c3e07668a7e36"
  instance_type = "t2.micro"

  subnet_id               = aws_subnet.public_subnet.id
  key_name                = aws_key_pair.london_region_key_pair.id
}

resource "aws_key_pair" "london_region_key_pair" {
  key_name   = "london_region_key_pair"
  public_key = file("/home/vlad/Desktop/london_region_key_pair.pub")
}
