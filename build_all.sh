#!/bin/bash
export JAVA_VERSION=11
export spark_version=3.1.2
export tag_version="-java.$JAVA_VERSION"

docker build -t base_jupyter:$spark_version ./jupyter
docker tag base_jupyter:$spark_version $image_regsitry/base_jupyter:$spark_version
docker push $image_regsitry/base_jupyter:$spark_version

docker build --build-arg JAVA_VERSION=$JAVA_VERSION --build-arg SOURCE_IMAGE=base_jupyter:$spark_version -t pyspark:$spark_version$tag_version ./pyspark
docker tag pyspark:$spark_version$tag_version $image_regsitry/pyspark:$spark_version$tag_version
docker push $image_regsitry/pyspark:$spark_version$tag_version

docker build  --build-arg SOURCE_IMAGE=pyspark:$spark_version$tag_version -t pyspark_docker:$spark_version$tag_version ./pyspark_docker
docker tag pyspark_docker:$spark_version$tag_version $image_regsitry/pyspark_docker:$spark_version$tag_version

docker push $image_regsitry/pyspark_docker:$spark_version$tag_version

