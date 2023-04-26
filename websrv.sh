#!/bin/bash
# Maintainer: Muhammad Fakhri Abdillah
# https://github.com/mfakhriabdillah


function isUserRoot () {
    if ! [ $(id -u) = 0 ]; then
   echo "The script need to be run as root." >&2
   echo "The syntax must be 'sudo ./run.sh' "
   exit 1
fi
}

function gettingInformation (){
    echo "Enter your domain name"
    read domainName
}

function installDependencies () {
    echo "Checking the System..."
    echo "You are running on " $(uname -a)
    sudo apt update -y
    sudo apt install nginx php mysql-server -y
}

function getSourceRepo () {
    echo "Please input Github repository:"
    read repoSource
    echo "Cloning from $repoSource..."
    git clone $repoSource
 }

function copySourceCode () {
    sourceCode=$(echo "$repoSource" | cut -d '/' -f 5 | cut -d '.' -f 1)
    sudo cp -R $sourceCode /var/www/html/
}

function createNginxConfigFile () {
    sudo touch /etc/nginx/sites-available/$domainName
    touch ./$domainName
}

function configureNginxFile () {
    cat > /etc/nginx/sites-available/$domainName << EOF
    #cat > ./$domainName << EOF
    server {
	listen 80;
	listen [::]:80;

	server_name $domainName;

	root /var/www/html/$sourceCode;
	index index.html index.php;

	location / {
		try_files $uri $uri/ =404;
	}
}
EOF

}

function configureNginx () {
    ln -s /etc/nginx/sites-available/$domainName /etc/nginx/sites-enabled
    sudo nginx -t
    sudo systemctl restart nginx.service
}

function finalTesting () {
    curl $domainName
}


isUserRoot
gettingInformation
installDependencies
getSourceRepo
copySourceCode
createNginxConfigFile
configureNginxFile
configureNginx
finalTesting