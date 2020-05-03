This repo contains necessary fix to run MLPerf 0.5 inference with only one NVidia Tesla T4 adapter

## working directory
```
cd closed/NVIDIA
```

## build docker image
```
./wkbuild.sh
```

you should see it 
```
host:~/nvidia/inference_results_v0.5/closed/NVIDIAi$ docker images 
REPOSITORY                  TAG                             IMAGE ID            CREATED             SIZE
mlperf-inference            wk                              150c70e3abbd        8 hours ago         9.54GB
```

## run the image
we will build and run MLPerf inside the container
```
./wkrun.sh
``` 
