#!/bin/sh
if [ $1 ]; then
	val=$1
else
  val='latest'
fi

echo "docker login..."
sudo docker login -u cistechfutures

echo "docker build cistechfutures/uberany:$val"
sudo docker build -t cistechfutures/uberany:$val --rm .

echo "docker push cistechfutures/uberany:$val"
sudo docker push cistechfutures/uberany:$val