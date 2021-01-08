# docker-vnc-flatcam
Ubuntu/LXDE/VNC desktop with gpredict pre-installed.

This is a low effort hack-together cobbling on a public holiday so will be janky and support is non-existant.

Credits to:
* gpredict
* Docker Ubuntu VNC Desktop - https://github.com/fcwu/docker-ubuntu-vnc-desktop

# Usage
```
docker run -it --rm -v ~/Desktop/shared_writable/:/root/Desktop -v ~/Desktop/shared_user_profile/.config:/root/.config -p 6090:80 -d -v /dev/shm:/dev/shm mbainrot/docker-vnc-gpredict
```

Then navigate ye web browser to http://localhost:6090

For further usage information please see: https://github.com/fcwu/docker-ubuntu-vnc-desktop as this container is based on that container.

