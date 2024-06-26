#!/bin/sh

sudo add-apt-repository ppa:webupd8team/terminix
sudo apt-get update
sudo apt install tilix -y

mkdir ~/.config/tilix
mkdir ~/.config/tilix/schemes/

cd ~/.config/tilix/schemes/

echo "{
    "name": "Argonaut",
    "comment": "Ported for Terminix Colour Scheme",
    "use-theme-colors": false,
    "foreground-color": "#fffaf4",
    "background-color": "#0e1019",
    "palette": [
        "#232323",
        "#ff000f",
        "#8ce10b",
        "#ffb900",
        "#008df8",
        "#6d43a6",
        "#00d8eb",
        "#ffffff",
        "#444444",
        "#ff2740",
        "#abe15b",
        "#ffd242",
        "#0092ff",
        "#9a5feb",
        "#67fff0",
        "#ffffff"
    ]
}" > argonaut.json