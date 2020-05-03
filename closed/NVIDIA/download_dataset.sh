#!/bin/sh
DATA_DIR=${PWD}/build/data

## imagenet 2012
nfiles=`ls $DATA_DIR/imagenet |wc -l`
if [ $nfiles -lt 50000 ]; then
  if [ ! -e $DATA_DIR/imagenet/ILSVRC2012_img_val.tar ]; then
    rtorrent "magnet:?xt=urn:btih:5d6d0df7ed81efd49ca99ea4737e0ae5e3a5f2e5&tr=http%3A%2F%2Facademictorrents.com%2Fannounce.php&tr=udp%3A%2F%2Ftracker.coppersurfer.tk%3A6969&tr=udp%3A%2F%2Ftracker.opentrackr.org%3A1337%2Fannounce&tr=udp%3A%2F%2Ftracker.leechers-paradise.org%3A6969"
  fi
  cd $DATA_DIR/imagenet
  tar ILSVRC2012_img_val.tar
fi

mkdir -p $DATA_DIR/coco
[ -e $DATA_DIR/coco/train2017.zip ] || wget http://images.cocodataset.org/zips/train2017.zip -O $DATA_DIR/coco/train2017.zip
[ -e $DATA_DIR/coco/val2017.zip ] || wget http://images.cocodataset.org/zips/val2017.zip -O $DATA_DIR/coco/val2017.zip
[ -e $DATA_DIR/coco/annotations_trainval2017.zip ] || wget http://images.cocodataset.org/annotations/annotations_trainval2017.zip -O $DATA_DIR/coco/annotations_trainval2017.zip

cd $DATA_DIR/coco
[ -e $DATA_DIR/coco/train2017 ] ||  unzip train2017.zip
[ -e $DATA_DIR/coco/val2017 ] ||  unzip val2017.zip
[ -e $DATA_DIR/coco/annotations ] ||  unzip annotations_trainval2017.zip

mkdir -p $DATA_DIR/nmt/GNMT
[ -e $DATA_DIR/nmt/gnmt_data.zip ] || wget -nv https://zenodo.org/record/3437893/files/gnmt_inference_data.zip -O $DATA_DIR/nmt/gnmt_data.zip
[ -e $DATA_DIR/nmt/GNMT/newstest2014.tok.bpe.32000.en.large ] || unzip $DATA_DIR/nmt/gnmt_data.zip -d $DATA_DIR/nmt/GNMT/
