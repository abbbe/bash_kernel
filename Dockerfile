FROM jupyter/base-notebook:latest

# Install dependencies for noVNC
USER root
RUN apt-get update && apt-get install -y \
    xvfb \
    x11vnc

# Switch back to the jovyan user
USER jovyan

# Install JupyterLab and noVNC extension
RUN pip install jupyterlab==3.0.0 novnc-jupyter

# Enable the noVNC extension
RUN jupyter labextension install novnc-jupyter
