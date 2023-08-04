INSTALL_DIR=/tmp/d`echo $RANDOM`
git clone https://github.com/Mafrans/arch-configs.git $INSTALL_DIR

DEPENDENCIES=$(cat $INSTALL_DIR/dependencies.txt | xargs)
if command -v paru
then
  paru -Sy $DEPENDENCIES
elif command -v yay
then
  yay -Sy $DEPENDENCIES
fi

find $INSTALL_DIR -maxdepth 1 -not -iname ".*" -execdir cp -r {} ~/.config \;
rm -rf $INSTALL_DIR

