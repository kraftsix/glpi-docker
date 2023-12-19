
dockerfile="Dockerfile.2"

TAG_APPEND="-prebuilt"
TAG="latest"
VERSION_TAG=$1

IMAGE_NAME="kraftsix/glpi"

REPOSITORY="$IMAGE_NAME:$TAG$TAG_APPEND"
REPOSITORY_VERSION="$IMAGE_NAME:$VERSION_TAG$TAG_APPEND"

docker build --no-cache -t $REPOSITORY -f $dockerfile .
docker login
docker push $REPOSITORY

if [ -z "$1" ]
  then
    echo "No VERSION_TAG supplied"
    docker logout
    exit
fi

docker build --no-cache -t $REPOSITORY_VERSION .
docker push $REPOSITORY_VERSION
docker logout


