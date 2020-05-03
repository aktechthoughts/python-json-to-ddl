#!/bin/bash

docker run -v /home/ubuntu/.aws:/root/.aws -v /home/ubuntu/data:/app/data -t aktechthoughts/aws-cli
