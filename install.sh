find . -maxdepth 1 -type d -not -iname ".*" -exec ln -s $PWD/{} ~/.config \;

