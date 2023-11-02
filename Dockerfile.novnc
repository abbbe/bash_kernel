FROM jupyter/base-notebook:latest

# Install dependencies for noVNC
USER root
RUN apt-get update && apt-get install -y \
    xvfb \
    x11vnc

# Install useful packages
RUN apt-get install -y lsof tmux git curl

# Install noVNC websocksifier
RUN git clone https://github.com/novnc/noVNC.git /usr/local/novnc
RUN git clone https://github.com/novnc/websockify.git /usr/local/novnc/utils/websockify

# Set up an entrypoint
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

# Switch back to the jovyan user
USER jovyan

# Install JupyterLab and noVNC extension
# RUN pip install jupyterlab==3.0.0 novnc-jupyter
RUN pip install jupyterlab jupyterlab-novnc

# Enable the noVNC extension
#RUN jupyter labextension install jupyterlab-novnc

EXPOSE 8888 6080
ENTRYPOINT ["/entrypoint.sh"]
