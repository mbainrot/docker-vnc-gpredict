# docker-vnc-gpredict
Ubuntu/LXDE/VNC desktop with gpredict pre-installed.

This is a low effort hack-together cobbling on a public holiday so will be janky and support is non-existant.

Credits to:
* gpredict
* Docker Ubuntu VNC Desktop - https://github.com/fcwu/docker-ubuntu-vnc-desktop

# Usage
```
docker run -it --rm -v ~/Desktop/shared_writable/:/root/Desktop -v ~/Desktop/shared_user_profile/.config:/root/.config -p 6090:80 -d -v /dev/shm:/dev/shm mbainrot/docker-vnc-gpredict
```

# Alt-usage
This exposes the VNC port rather than the no-vnc server allowing you to use a proper vnc client 
```
docker run -it --rm -v ~/Desktop/shared_writable/:/root/Desktop -v ~/Desktop/shared_user_profile/.config:/root/.config -p 6090:80 -p 5900:5900 -d -v /dev/shm:/dev/shm mbainrot/docker-vnc-gpredict
```

# Alt-usage no. 2
This exposes the VNC port rather than the no-vnc server allowing you to use a proper vnc client and also sets the resolution to 1080p (as VNC clients do not always direct the container to use a given resolution)
```
docker run -it --rm -v ~/Desktop/shared_writable/:/root/Desktop -v ~/Desktop/shared_user_profile/.config:/root/.config -p 6090:80 -p 5900:5900 -d -v /dev/shm:/dev/shm -e RESOLUTION=1920x1080 mbainrot/docker-vnc-gpredict
```

# Connecting
For all of the examples above you can navigate your web browser to http://localhost:6090

For the alternative usage options you can either navigate your web browser to http://localhost:6090 or connect your VNC client to localhost:5900

For further usage information please see: https://github.com/fcwu/docker-ubuntu-vnc-desktop as this container is a remix of that container.

