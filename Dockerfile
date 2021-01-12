FROM dorowu/ubuntu-desktop-lxde-vnc
LABEL maintainer="mbainrot@github.com"

# First we have to retrieve some tools as FlatCAM 8.99 has some issues
# that need to be sorted out in order for it to setup/run properly under ubuntu.
RUN apt-get update && apt-get install -y gpredict

# Next we build an application shortcut and link it to /root
#RUN echo "[Desktop Entry]\nName=FlatCAM 8.99\nExec=python3 /usr/flatcam/FlatCAM.py\n\
#	Type=Application\nIcon=/usr/flatcam/share/flatcam_icon128.png" \
#    > /usr/share/applications/FlatCAM.desktop

# Create desktop shortcut for root
#RUN mkdir -p /root/Desktop && \
#    echo "[Desktop Entry]\nType=Link\nName=FlatCAM 8.99\n\
#    Icon=/usr/flatcam/share/flatcam_icon128.png\n\
#	URL=/usr/share/applications/FlatCAM.desktop" > /root/Desktop/flatcam.desktop

# Change the name of the page so the tab makes sense
RUN cat /usr/local/lib/web/frontend/index.html | sed -E 's/novnc2/novnc2 - gpredict/' > /usr/local/lib/web/frontend/index.html.temp && \
    mv /usr/local/lib/web/frontend/index.html.temp /usr/local/lib/web/frontend/index.html

# We reuse this stuff from dorowu/ubuntu-desktop-lxde-vnc so the container starts as it should
EXPOSE 80
WORKDIR /root
ENV HOME=/home/ubuntu SHELL=/bin/bash
HEALTHCHECK --interval=30s --timeout=5s CMD curl --fail http://127.0.0.1:6079/api/health
ENTRYPOINT ["/startup.sh"]