# ubuntuserverservices
How to start and setup ubuntu server 24 primary services in VirtualBox

Setting up primary services on an Ubuntu Server 24 in VirtualBox involves configuring the server for common tasks such as networking, SSH access, web hosting, database management, and more. Below is a step-by-step guide to help you set up these services:
________________________________________
Step 1: Install Ubuntu Server 24 in VirtualBox
1.	Download the Ubuntu Server 24 ISO from the official Ubuntu website.
2.	Create a new virtual machine in VirtualBox:
o	Set the type to Linux and version to Ubuntu (64-bit).
o	Allocate sufficient resources (e.g., 2+ GB RAM, 2+ CPU cores, 20+ GB disk space).
3.	Attach the Ubuntu Server ISO to the virtual machine and start the installation.
4.	Follow the installation wizard to complete the setup:
o	Set up a user account and password.
o	Enable OpenSSH server during installation for remote access.
________________________________________
Step 2: Configure Networking
1.	Ensure the virtual machine is using Bridged Adapter or NAT in VirtualBox:
o	Go to Settings > Network and select the appropriate adapter.
2.	Verify the network configuration:
ip a
3.	If needed, configure a static IP using Netplan (see the previous guide for dual-stack IPv4/IPv6 setup).
________________________________________
Step 3: Update the System
1.	Update the package list and upgrade installed packages:
sudo apt update && sudo apt upgrade -y
________________________________________
Step 4: Set Up SSH Access
1.	Ensure the OpenSSH server is installed:
sudo apt install openssh-server
2.	Enable and start the SSH service:
sudo systemctl enable ssh
sudo systemctl start ssh
3.	Test SSH access from your host machine or another system:
ssh username@server-ip
________________________________________
Step 5: Install a Web Server (Apache or Nginx)
1.	Install Apache:
sudo apt install apache2
Or install Nginx:
sudo apt install nginx
2.	Enable and start the web server:
sudo systemctl enable apache2  # or nginx
sudo systemctl start apache2   # or nginx
3.	Test the web server by visiting http://server-ip in a browser.
________________________________________
Step 6: Install a Database Server (MySQL or PostgreSQL)
1.	Install MySQL:
sudo apt install mysql-server
Or install PostgreSQL:
sudo apt install postgresql
2.	Secure the database server:
o	For MySQL:
sudo mysql_secure_installation
o	For PostgreSQL, configure authentication in /etc/postgresql/*/main/pg_hba.conf.
3.	Test the database server by logging in:
sudo mysql -u root -p  # For MySQL
sudo -u postgres psql  # For PostgreSQL
________________________________________
Step 7: Install PHP (for Dynamic Web Content)
1.	Install PHP and necessary modules:
sudo apt install php libapache2-mod-php php-mysql
2.	Test PHP by creating a info.php file in the web root:
sudo nano /var/www/html/info.php
Add the following content:
<?php phpinfo(); ?>
3.	Visit http://server-ip/info.php in a browser to verify PHP is working.
________________________________________
Step 8: Set Up a Firewall (UFW)
1.	Install UFW (Uncomplicated Firewall):
sudo apt install ufw
2.	Allow necessary services:
sudo ufw allow ssh
sudo ufw allow http
sudo ufw allow https
3.	Enable the firewall:
sudo ufw enable
________________________________________
Step 9: Install Additional Services (Optional)
1.	File Sharing (Samba):
sudo apt install samba
Configure Samba by editing /etc/samba/smb.conf.
2.	FTP Server (vsftpd):
sudo apt install vsftpd
Configure vsftpd by editing /etc/vsftpd.conf.
3.	Email Server (Postfix):
sudo apt install postfix
Follow the Postfix setup wizard.
________________________________________
Step 10: Backup and Monitoring
1.	Set up automated backups using rsync or cron jobs.
2.	Install monitoring tools like htop or glances:
sudo apt install htop glances
________________________________________
