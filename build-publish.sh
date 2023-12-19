
dockerfile="Dockerfile"

TAG="latest"
VERSION_TAG=$1

IMAGE_NAME="kraftsix/glpi"

REPOSITORY="$IMAGENAME:$TAG"
REPOSITORY_VERSION="$IMAGENAME:$VERSION_TAG"

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