#!/bin/sh

//docker run -t -i --name ubertest -p 80:80 -p 8080:8080 -p 3001:3001 -e giturl=https://github.com/CIS-Tech-Futures/hello-world-node.git -e username=cistechfutures -e password=techfutu13 cistechfutures/uberany:v5

docker run -t -i --name ubertest -p 80:80 -p 8080:8080 -p 3001:3001 -e giturl=https://github.com/CIS-Tech-Futures/hello-world-node.git -e username=cistechfutures -e password=techfutu13 -e branch=master cistechfutures/uberany:v5
