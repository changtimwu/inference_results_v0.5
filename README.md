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

=====================
== NVIDIA TensorRT ==
=====================

NVIDIA Release 19.09 (build 7989553)

NVIDIA TensorRT 6.0.1 (c) 2016-2019, NVIDIA CORPORATION.  All rights reserved.
Container image (c) 2019, NVIDIA CORPORATION.  All rights reserved.

https://developer.nvidia.com/tensorrt

To install Python sample dependencies, run /opt/tensorrt/python/python_setup.sh

root@30f549b94c1c:/work# 

```

## download dataset
download `imagenet`, `coco`, `gnmt` dataset
```
./download_dataset.sh
```

## build MLPerf

* first time build 
```
root@30f549b94c1c:/work# make build 
```

* you are supoosed to encounter errors.   that's because the generated `pkg-config.py` is using python2 syntax.  Replace it with ours.

```
root@30f549b94c1c:/work# cp ./wkfiles/pkg-config.py ./build/inference/build/config/linux/pkg-config.py
```
* build again
```
make build
```

## preprocess dataset
this takes quite a lot time
```
root@13fb055d9466:/work# make preprocess_data
```
download models
```
root@30f549b94c1c:/work# make download_model
```

## resnet benchmark
calibrate
```
make calibrate RUN_ARGS="--benchmarks=resnet"
```

run offline benchmark
```
make run RUN_ARGS="--benchmarks=ResNet50 --scenarios=offline --gpu_batch_size=128"
```

run offline benchmark
```
make run RUN_ARGS="--benchmarks=ResNet50 --scenarios=offline --test_mode=PerformanceOnly"
```


## SSD benchmark
```
make calibrate RUN_ARGS="--benchmarks=ssd-large"
```
