#!/bin/sh
opts="--gpus all"
ctid="mlperf-inference:wk"
#portopts="-p 8888:8888 -p 6006:6006"
volopts="-v $(realpath .):/work"
docker run $opts -it --rm $volopts $portopts $ctid 

