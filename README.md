    docker volume ls
    docker volume ls rm name

Check status

    docker ps -a
    docker images
    docker volume ls

Optional: full Docker cleanup (GLOBAL — will remove everything unused)

    docker system prune -a --volumes -f
    docker rmi $(docker images -q)
    docker system prune -a --volumes

Disable

    docker compose down -v

Run

    docker compose up -d

After starting the container, you need to

    sudo chmod 777 -R www/


start the build

    docker compose up -d --build

When you first start, a dump of a clean CMS will be loaded into the database (in this folder opencart 4.1)

projects create their own components and different cms will not overwrite each other.

After starting the project, there may be problems editing files in the www folder
You need to run the command

    sudo chmod 777 -R www/

After starting the project

the site is available http://localhost:8081/index.php

To start phpmyadmin http://localhost:8082/

To change the ports, you can edit the .env file

Also in the .env file are the login and password for the admin (ADMIN_LOGIN,ADMIN_PASSWORD)

Also ADMIN_URL - a link to go to the admin