# Dependencies
tar xfvz ffmpeg.tgz
cd ffmpeg/archives
sudo dpkg -i *.deb

tar xfvz scrcpy.build.deps.tgz
cd scrcpy.build.deps
sudo dpkg -i *.deb

# Installs from an already built Archive of the Git repository
tar xfvz scrcpy.built.tgz
sudo mkdir -p /usr/local/share/scrcpy/
sudo cp scrcpy.built/server/scrcpy-server /usr/local/share/scrcpy/
sudo chown -R mr:mr /usr/local/share/scrcpy/*
sudo cp scrcpy.built/build-auto/app/scrcpy /usr/local/bin/
sudo chown -R mr:mr /usr/local/bin/scrcpy
