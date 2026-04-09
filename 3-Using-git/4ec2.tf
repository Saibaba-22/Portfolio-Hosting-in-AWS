# EC2 Instance
resource "aws_instance" "my_ec2" {
  ami             = "ami-0b8b44ec9a8f90422" # Ubuntu 22.04 (us-east-1)
  instance_type   = "t3.small"
  subnet_id       = aws_subnet.my_subnet.id
  security_groups = [aws_security_group.my_sg.id]

  associate_public_ip_address = true

  # User Data script to install Nginx and write your exact HTML file
  user_data = <<-EOF
#!/bin/bash
sudo apt update -y
sudo apt install nginx git -y
sudo systemctl start nginx
sudo systemctl enable nginx

cd /home/ubuntu
git clone https://github.com/Saibaba-22/portfoliofile.git

sudo rm -rf /var/www/html/*
sudo cp -r /home/ubuntu/portfoliofile/* /var/www/html/

sudo chown -R www-data:www-data /var/www/html
sudo chmod -R 755 /var/www/html
sudo systemctl restart nginx

HTML_EOF
EOF


  tags = {
    Name = "EC2-Sai"
  }
}

