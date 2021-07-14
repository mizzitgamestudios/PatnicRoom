if [ ! -d "../src" ] ;then
  echo "----EXCEPTION----"
  echo "Folder 'src' does not exist in root,please create one and restart the Script"
else
  if [ ! -d "../src/resources" ] ;then
    echo "----EXCEPTION----"
    echo "Folder 'resources' in 'src' does not exist, please make sure you unrared your VSCode "
  else


    mkdir "../Backups"
    echo "copying extensions of Installer to root/src/data..."
    mkdir "../src/data"
    cp -r "extensions" "../src/data"
    echo "copying finished ------------------------"


    echo "copying keybinds of Installer to root/src/data/user-data/User..."
    mkdir "../src/data/user-data"
    mkdir "../src/data/user-data/User"
    cp -r "Settings/keybindings.json" "../src/data/user-data/User"
    echo "copying finished ------------------------"


    echo "copying Editor-Settings of Installer to root/src/data/user-data/User..."
    cp -r "Settings/settings.json" "../src/data/user-data/User"
    echo "copying finished ------------------------"


    mkdir "../PatnicRoom Prepper Edition Workspace"
    cd "../PatnicRoom Prepper Edition Workspace"
    git clone https://github.com/mizzitgamestudios/PatnicRoom.git

    echo "creates config-file and builds relation to Workspaces"
    cd "Workspaces/GameData"
    path=$(pwd)
    cd "../.."
    echo "copying finished ------------------------"


    echo
    echo "setup complete!!"


  fi
fi

read -r foobar ""
