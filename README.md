# webserver# webserver

This is project is a preconfigured local dev environment for **wordpress**, which only **requires docker**.
I created this repo for my own needs; to have a private git repo from which I can pull from any machine, start working on in seconds, commit & push to git, and pick up the work from anywhere else.
### Features

  * apache2 web server with php
  * MySQL database
  * Easily start and stop everything in seconds with just one command
  * Automated with custom scripts:
    *  backup and sync the db when stopping the container
    *  load backup from the host machine when starting the container
    *  pull the latest wordpress release if the html directory is empty

### Initial setup
1) Setup docker
2) Pull from github
3) ```sh
    $ docker-compose up -d
    ```
4) Open localhost on your browser
5) Configure wordpress (**defaults**):
db hostname: ```db```
database: ```wordpress```
db user: ```root```
db password: ```password```

This concludes the basic setup.
### Tips and tricks
Coming soon ;)
### Todo
* Add custom command to the db image which will create a backup, so that you don't have to ssh into the container to do it manually.