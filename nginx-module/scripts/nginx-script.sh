#!/bin/bash
sudo apt update -y
sudo apt install -y nginx

# Create index.html with H1 tag in the default NGINX web directory
echo "<h1>Hello From Ubuntu EC2 Instance!!!</h1>" | sudo tee /var/www/html/index.html

# Restart NGINX to apply the changes
sudo systemctl restart nginx