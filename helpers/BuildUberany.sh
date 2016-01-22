#!/bin/sh

if [ $1 ]; then
	val=$1
else
  val='latest'
fi

echo "Building Docker container for uberany"
docker build -t cistechfutures/uberany:$val --rm .

echo "Login to Docker repo"
docker login

echo "Pushing to Hub.Docker"
docker push cistechfutures/uberany:$val