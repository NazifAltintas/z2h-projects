#!/bin/bash
sudo yum update -y && sudo yum install -y docker
sudo service docker start 
sudo usermod -aG docker ec2-user
docker run -p 8080:80 nginx
sudo amazon-linux-extras install ansible2
sudo ansible --version