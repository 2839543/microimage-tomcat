#!/bin/bash

set -e

export CON_NAME=tomcat_t
export REG_URL=d.nicescale.com:5000
export IMAGE=tomcat
export TAGS="8.0 8.0.26"
export BASE_IMAGE=microimages/jre

docker pull $REG_URL/$BASE_IMAGE

docker tag -f $REG_URL/$BASE_IMAGE $BASE_IMAGE

docker build -t $REG_URL/microimages/$IMAGE .

#./test.sh

echo "---> Starting push $REG_URL/microimages/$IMAGE:$VERSION"

for t in $TAGS; do
  docker tag -f $REG_URL/microimages/$IMAGE $REG_URL/microimages/$IMAGE:$t
done

docker push $REG_URL/microimages/$IMAGE
