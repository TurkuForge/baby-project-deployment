#!/usr/bin/env bash
# This file is run once the Docker container in this repo has been built and started.

if [ -f .env ]
then
  export $(cat .env | sed 's/#.*//g' | xargs)
fi

# Prints out version
echo "$VERSION"

# Defines some variables
ZIP_FILE_NAME="baby-project-server-v$VERSION.zip"
REPO_URL="https://github.com/TurkuForge/baby-project-server/releases/download/v$VERSION/$ZIP_FILE_NAME"
FOLDER_NAME="baby-project-server"
JAR_PATH="$FOLDER_NAME/libs/babyproject-$VERSION.jar"

echo "Downloads given version"
wget "$REPO_URL"

echo "Unzipping download zip"
unzip "$ZIP_FILE_NAME" -d "$FOLDER_NAME"

echo "Starting server"
java -jar "$JAR_PATH" --server.port=80


