#!/bin/sh
docker build -t mlperf-inference:wk --network host -f docker/Dockerfile.wk1 .
