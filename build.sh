#!/bin/sh

set -e

if [ "$1" = 'clean' ]; then
    if [ "$2" <> null ];then
      composeFile=$2
    else
      echo 'Enter compose file name as second parameter!!!' 
      exit
    fi
    docker-compose -f $composeFile down -v    
elif [ "$1" = 'down' ]; then
    if [ "$2" <> null ];then
      composeFile=$2
    else
      echo 'Enter compose file name as second parameter!!!' 
      exit
    fi
    docker-compose -f $composeFile down
elif [ "$1" = 'up' ]; then
    if [ "$2" <> null ];then
      composeFile=$2
    else
      echo 'Enter compose file name as second parameter!!!' 
      exit
    fi
    docker-compose -f $composeFile up -d --force-recreate
elif [ "$1" = 'build' ]; then
    if [ "$2" <> null ];then
      composeFile=$2
    else
      echo 'Enter compose file name as second parameter!!!' 
      exit
    fi
    docker-compose -f $composeFile up -d --build
elif [ "$1" = 'help' ]; then
    echo '#####################  Build script ##################################'
    echo 'This is a build script to run the project for esh'
    echo ' '
    echo 'you have the following options to run this:'
    echo '1) up - run this with: build.sh up {docker-compose file path}'
    echo '   this command will spin up the compose file and create the docker containers '
    echo '1) build - run this with: build.sh build {docker-compose file path}'
    echo '   this command will rebuild the images and spin up the compose file with the docker containers '
    echo '2) down - run this with: build.sh down [docker-compose file path}'
    echo '   this command will spin down the compose file and stop the docker containers  '
    echo '3) clean - run this with: build.sh clean [docker-compose file path}'
    echo '   this command will spin down the compose file, stop the docker containers   '
    echo '   and delete volumes created for the project'
    echo '4) restart - run this with: build.sh restart'
    echo '   this command will restart the docker containers in the compose file  '
    echo '5) logs - run this with: build.sh logs'
    echo '   this command will show the logs of the docker containers running on the machine'
    echo '#######################################################'
else
    echo 'Invalid command!!!'
    echo 'Usage: ./build.sh [clean|down|up|build] [compose file name]'
    exit
fi