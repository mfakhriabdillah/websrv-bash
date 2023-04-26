
# NGINX Automation Setup Script

This repository contains simple bash script that automate NGINX installation and configuration.

You just need to prepare your code and store it into GitHub repository, and this script will automatically clone and configure the virtualserver as you want.








## Usage/Examples

Clone this repository
```shell
git clone https://github.com/mfakhriabdillah/websrv-bash.git

cd websrv-bash
```

Run the script (sudo required)
```shell
sudo ./websrv
```

If you run without sudo, there's some warning like this
```
The script need to be run as root.
The syntax must be 'sudo ./websrv.sh' 
```

Enter your domain name. For example:
```
Enter your domain name:
websrv.com
```

Enter your Github repository. For example:
```
Please enter your source code (GitHub repository)
https://github.com/sdcilsy/landing-page.git
```

After that, the script automatically create a Nginx virtualhost configuration file with the domain that you enter before.

## Authors

- [@mfakhriabdillah](https://www.github.com/mfakhriabdillah)

