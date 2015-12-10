# uberany
## Summary
The idea is to point this Docker at any git repo and have it run the project.

In order for this to work, the project should have a run.sh to run the code. If installation or setup is required, an optional build.sh can be used.

It also assumes that the project uses *one* of:

* NodeJS & npm (v 0.10.25/v 1.4.21)
* Python (v 2.7.9)
* Java (v 1.8.0-66-b17)
* Clojure (v 2.5.3)

## Deployment
The git repo is *ALWAYS* checked out to the /home/project directory in the Container. It does **NOT** use the repo name as a directory. Restarting an existing container will re-start the project - it will NOT re-clone the git repo unless you delete the /home/project directory before the restart.

## Build.sh

A build.sh for a NodeJS project can be as simple as

```bash
#!/bin/bash

npm install
```

## Run.sh
Equally, the run script could be 

```bash
#!/bin/bash

node app.js
```

# Build Container
Checkout the uberany project into a folder and then build the Docker Container using:

```bash
docker build -t cistechfutures/uberany .
```

# Useage
You can then run the Docker using the following command. 

```bash
docker run -d -p 3000:3000 -p 8080:8080 -p 80:80 --name ????? -e giturl=??? cistechfutures/uberany
```

This will run a Container in detached mode - perfect for use with web based apps. For command line/bash based apps we could use:

```bash
docker run -t -i --name ????? -e giturl=??? cistechfutures/uberany
```

### Notes
* You need to specify the *working name* of the container and the **SSH path** to the git repo you want to clone from. 
* This process assumes that the correct ssh public/private keys are installed in all the right places for the repo you are accessing.
* Only ports 3000, 8080 & 80 are exposed by Docker. If you want to open others, you will need to modify the Dockerfile prior to building the Container.
* Remember 'localhost' won't work - you will need the Container IP!

