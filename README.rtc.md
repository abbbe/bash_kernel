Build an image of JupyterLab with RTC activated.
```
docker build -t jupyterlab-rtc -f Dockerfile.rtc .
```

Run it:
```
docker run -p 8888:8888 jupyterlab-rtc
```

Open http://localhost:8888/
