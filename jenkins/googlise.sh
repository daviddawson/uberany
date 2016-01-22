#!/bin/sh
if [ $1 ]; then
	val=$1
else
  val='latest'
fi

#Tag Docker image with Google tags
echo "Tagging container to Google project"
sudo docker tag -f cistechfutures/uberany:$val eu.gcr.io/oval-method-115410/uberany:latest

#Push to Google Cloud
echo "Pushing Docker container to Google Cloud"
sudo /var/lib/jenkins/google-cloud-sdk/bin/gcloud docker push eu.gcr.io/oval-method-115410/uberany:latest
