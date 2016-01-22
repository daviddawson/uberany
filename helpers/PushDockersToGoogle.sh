#!/bin/sh

if [ $1 ]; then
	val=$1
else
  val='latest'
fi

#Tag Docker image with Google tags
docker tag cistechfutures/uberany:$val eu.gcr.io/oval-method-115410/uberany:$val

#Push to Google Cloud
gcloud docker push eu.gcr.io/oval-method-115410/uberany:$val