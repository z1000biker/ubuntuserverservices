#!/bin/bash

# Update and Upgrade System
echo "Updating and upgrading the system..."
sudo apt update && sudo apt upgrade -y

# Install OpenSSH Server
echo "Installing OpenSSH server..."
sudo apt install openssh-server -y
sudo systemctl enable ssh
sudo systemctl start ssh

# Install Apache Web Server
echo "Installing Apache web server..."
sudo apt install apache2 -y
sudo systemctl enable apache2
sudo systemctl start apache2

# Install MySQL Database Server
echo "Installing MySQL server..."
sudo apt install mysql-server -y
sudo systemctl enable mysql
sudo systemctl start mysql

# Secure MySQL Installation
echo "Securing MySQL installation..."
sudo mysql_secure_installation <<EOF
n
y
y
y
y
EOF

# Install PHP
echo "Installing PHP and necessary modules..."
sudo apt install php libapache2-mod-php php-mysql -y

# Test PHP Configuration
echo "Creating PHP info file..."
sudo bash -c 'echo "<?php phpinfo(); ?>" > /var/www/html/info.php'

# Install UFW Firewall
echo "Installing and configuring UFW firewall..."
sudo apt install ufw -y
sudo ufw allow ssh
sudo ufw allow http
sudo ufw allow https
sudo ufw enable

# Install Additional Services (Optional)
# Uncomment the following lines if needed

# Install Samba for File Sharing
# echo "Installing Samba..."
# sudo apt install samba -y

# Install vsftpd for FTP Server
# echo "Installing vsftpd..."
# sudo apt install vsftpd -y

# Install Postfix for Email Server
# echo "Installing Postfix..."
# sudo apt install postfix -y

# Install Monitoring Tools
echo "Installing monitoring tools..."
sudo apt install htop glances -y

# Display Completion Message
echo "Setup completed successfully!"
echo "You can access the web server at http://$(hostname -I | awk '{print $1}')"
echo "PHP info page: http://$(hostname -I | awk '{print $1}')/info.php"
