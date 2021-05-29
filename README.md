# jupyter-spark


Sample of use: [https://github.com/6za/runbooks-jupyter/blob/master/01-SimpleDockerTest.ipynb](https://github.com/6za/runbooks-jupyter/blob/master/01-SimpleDockerTest.ipynb)


# Notes
- address `tzdata`


# run

```bash 
docker build -t jupyter:2.4.4 ./jupyter
docker build -t pyspark:2.4.4 ./pyspark
docker build -t pyspark_docker:2.4.4 ./pyspark_docker
```
