# Analysis in a Docker Container

## Build with:
```
docker build --rm -t veraanalysis .
```

## Run with:
```
docker run -v C:/where/this/directory/is:/vera -p 8888:8888 -it veraanalysis bash
```

The above says to mount the directory `C:\where\this\directory\is` into `/vera` within the container,
then it gives you a bash shell that starts out in `/vera/analyses`. It also exposes port 8888 so you can run jupyter notebooks.


You can run jupyter directly with:
```
docker run -v C:/where/this/directory/is:/vera -p 8888:8888 -it veraanalysis jupyter notebook
```
