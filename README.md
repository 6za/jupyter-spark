# jupyter-spark


```bash 
docker build ./jupyter -t jupyter-6za
docker build ./pyspark -t pyspark-6za

docker build ./pyspark_docker -t pyspark-docker-6za
docker run -p 0.0.0.0:8888:8888 -i -t pyspark-docker 
```

# Notes
- address `tzdata`