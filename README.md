# Minimal Android CI
## Build Docker Image
```
cd minimal-android-ci/

docker build . -t android-ci:1.0
```
## Create container and start CI
```
docker run -id --name=android-ci android-ci:1.0 \
&& docker cp ci.sh android-ci:/ \
&& docker exec android-ci bash ci.sh
```
## Configure Github Token for Private Repositories
```
./configure_github_token.sh android-ci [TOKEN]
```
