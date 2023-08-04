INSTALL_DIR=/tmp/d`$RANDOM|md5sum`

if [ which paru ] then
  echo $INSTALL_DIR/dependencies.txt | paru -Sy
elif [ which yay ] then
  echo $INSTALL_DIR/dependencies.txt | yay -Sy
fi

rm -rf $INSTALL_DIR
git clone https://github.com/Mafrans/arch-configs.git $INSTALL_DIR
find $INSTALL_DIR -maxdepth 1 -not -iname ".*" -execdir cp -r {} ~/.config \;

