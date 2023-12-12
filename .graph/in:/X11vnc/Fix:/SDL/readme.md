# Try
```
sudo apt install xorg-dev libx11-dev libgl1-mesa-glx libsdl2-dev
```

# Error: "Could not initialize SDL - No available video device"
https://www.linuxquestions.org/questions/linux-newbie-8/could-not-initialize-sdl-no-available-video-device-772924/

```
sudo apt-get install xorg-dev
export SDL_VIDEODRIVER=X11
```
