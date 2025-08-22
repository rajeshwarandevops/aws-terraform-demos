#!/bin/bash
yum update -y
yum install -y nginx
systemctl enable nginx
systemctl start nginx

cat <<EOT > /usr/share/nginx/html/index.html
<html>
<head><title>Welcome</title></head>
<body style="background-color:white;">
  <h1 style="color:red; text-align:center; margin-top:20%;">Welcome to DevOpsforU Channel</h1>
</body>
</html>
EOT
