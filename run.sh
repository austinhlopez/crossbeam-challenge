#! /bin/bash

cd docker && docker-compose run --service-ports challenge $1 $2
