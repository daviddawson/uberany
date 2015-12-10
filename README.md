# uberany
## Summary
The idea is to point this Docker at any git repo and have it run the project.

In order for this to work, the project should have a run.sh to run the code. If installation or setup is required, an optional build.sh can be used.

It also assumes that the project uses *one* of:

* NodeJS & npm (v 0.10.25/v 1.4.21)
* Python (v 2.7.9)
* Java (v 1.8.0-66-b17)
* Clojure (v 2.5.3)
* Git (v 2.1.4)

## Deployment
The git repo is *ALWAYS* checked out to the /home/project directory. It does **NOT** use the repo name as a directory. 

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
Checkout this project into a folder and then build the Docker Container using:

```bash
docker build -t cistechfutures/uberany .
```

# Useage
You can then run the Docker using the following command. 

```bash
docker run -d -p 3000:3000 -p 8080:8080 -p 80:80 --name ????? -e giturl=???  cistechfutures/uberany
```

**Note** you need to specify the *working name* of the container and the **SSH path** to the git repo you want to clone from. This assumes that the correct ssh public/private keys are installed for the repo you are accessing.

