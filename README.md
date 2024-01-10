# Inception


![Intro](images/Inception.png)

## Table of Contents

1. [Description](#description)
2. [Usage](#usage)
3. [Roadmap](#roadmap)
4. [Helpful Resources](#helpful-resources)
5. [Links to Related Projects](#links-to-related-projects)
6. [Contact Information](#contact-information)

## Description

As a DevOps enthusiast, I am excited to present my comprehensive system administration project. Leveraging Docker, I have meticulously virtualized various services within a virtual machine, creating an efficient and scalable infrastructure.

Key services include NGINX for secure access, WordPress with PHP-FPM for content management, MariaDB for database management, Redis for efficient caching, an FTP server for convenient file transfers, a static website for showcasing creativity, Adminer for database administration, and Cadvisor for system monitoring.

By choosing Alpine Linux as the operating system for the containers, I have optimized resource utilization and ensured lightweight Docker images. This contributes to improved performance and reduced infrastructure costs.

Security is paramount, and I have implemented robust measures to protect the database from unauthorized access. This includes following industry best practices and adhering to strict security guidelines.

By accomplishing this project, I gained a broad and strong knowledge of several concepts and practices related to system administration.

## Usage

To use this project, follow these steps:

1. Create a new user named "zaabou".
````
sudo adduser zaabou
sudo passwd zaabou
`````
2. Add the hostname "zaabou.42.fr" to the `/etc/hosts` file.
````
sudo echo "127.0.0.1 zaabou.42.fr" | sudo tee -a /etc/hosts
`````
3. Run the `make` command to build the project.
`````
make
`````
4. Access the WordPress website by visiting the following URL in your web browser:

```
https://zaabou.42.fr
```

## Roadmap

To successfully complete this project, follow these steps:

1. Set up a virtual machine with Docker installed.
2. Create Dockerfiles for each service.
3. Configure NGINX for secure access using TLSv1.2 or TLSv1.3.
4. Set up WordPress with PHP-FPM and configure it to use MariaDB as the database.
5. Create a MariaDB container and configure it with a strong root password.
6. Set up Redis for efficient caching.
7. Create an FTP server for convenient file transfers.
8. Develop a static website to showcase your creativity.
9. Install Adminer for database administration.
10. (Optional) Install Cadvisor for system monitoring.
11. Configure a docker-network to establish the connection between your containers.

## Helpful Resources

- [Docker Documentation](https://docs.docker.com/)
- [NGINX Documentation](https://nginx.org/en/docs/)
- [WordPress Documentation](https://wordpress.org/support/)
- [PHP-FPM](https://www.php.net/manual/fr/install.fpm.php)
- [FTP](https://fr.wikipedia.org/wiki/File_Transfer_Protocol)
- [MariaDB Documentation](https://mariadb.com/kb/en/)
- [Redis Documentation](https://redis.io/documentation)
- [Alpine Linux Documentation](https://alpinelinux.org/documentation/)
- [Cadvisor Documentation](https://github.com/google/cadvisor/blob/main/docs/usage.md)
- [adminer](https://www.adminer.org/)
- [VirtualBox](https://www.virtualbox.org/)
## Links to Related Projects

- [Born2BeRoot](https://github.com/Ziko909/Born2BeRoot): This system administration project involves setting up a virtual machine with a server, implementing security measures, creating encrypted partitions, configuring firewalls, and setting up user management with strong password policies.
- [ft_transcendence](https://github.com/Ziko909/ft_transcendance): This project is a real-time multiplayer web application that gives users an unforgettable and enjoyable experience.

## Contact Information

- GitHub: Ziko909
- LinkedIn: Zakaria Aabou
- Gmail: aabou.zakaria909@gmail.com
