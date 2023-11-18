#!/bin/bash

echo '{"irods_host": "data.cyverse.org", "irods_port": 1247, "irods_zone_name": "iplant"}' | tee  > /home/user/.irods/irods_environment.json

wget https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.3.1/npp.8.3.1.Installer.exe \
    && wine npp.8.3.1.Installer.exe /S \
    && rm npp.8.3.1.Installer.exe

# replace the application 
cp --preserve=mode,timestamps /bin/Notepad++.desktop ~/.local/share/applications/wine/Programs/Notepad++.desktop
chmod +x ~/.local/share/applications/wine/Programs/Notepad++.desktop

exec xpra start --bind-tcp=0.0.0.0:9876 --html=on --start-child="wine" --start-child="wine /root/.wine/drive_c/Program\ Files/Notepad++/notepad++.exe" --exit-with-children=no --daemon=no --xvfb="/usr/bin/Xvfb +extension Composite -screen 0 1920x1080x24+32 -nolisten tcp -noreset" --file-transfer=on --pulseaudio=no --notifications=no --bell=no :100
