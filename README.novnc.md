JupyterLab with a local novnc server.
Requires older labs, unfortunately not compatible with collaboration plugin.

A similar solution, not based on Jupyter Stacks
https://stackoverflow.com/questions/70170122/how-to-add-novnc-in-dockerised-jupyterlab

Build novnc-enabled jupyterlab image:
```
docker build -t jupyterlab-novnc .
```

Run it:
```
docker run --name ju2 -p 8888:8888 -p 6080:6080 jupyterlab-novnc
```

If container runs on a remote host, make tunnels from the local workstaiton:
```
ssh -L 8888:localhost:8888 -L 6080:localhost:6080 -vN remotehost
```

*FIXME: here 6080 exposes VNC with a weak password.*

Try without lab: http://localhost:6080/vnc.html?host=127.0.0.1&port=6080&password=password

Open Jupyter Lab web UI at http://localhost:8888 (auth token can be found on container console)
Go to Settings / Advanced / JSON Editor / noVNC and configure the endpoint.
```
{
    "configured_endpoints": [
    {
        "name": "Robot",
        "host": "localhost",
        "port": 6080,
        "resize": "scale",
        "password": "password"
    }]
}
```

Start VNC/Robot session from the launcher of Jupyter Lab web UI.

References:
* https://chat.openai.com/share/b4ae2c1c-11eb-4f5c-a209-a898a701d3d2
* https://github.com/RoboStack/jupyterlab-novnc
* https://dl.acm.org/doi/pdf/10.1145/3491418.3535163
* https://snyk.io/advisor/python/jupyterlab-rtc-hub-settings
* https://github.com/jupyterhub/jupyter-server-proxy
