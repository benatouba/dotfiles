if [ $USER = "ben" ] 
then
    alias vim="~/.programs/nvim.appimage"
    alias nvim="~/.programs/nvim.appimage"
    alias up="sudo apt update && sudo apt upgrade && sudo apt autoremove && sudo apt clean && sudo apt autoclean"
    alias upconda="conda update -n base conda && conda update -n neovim3 --file ~/.dotfiles/conda_neovim3.yaml"
    alias upvim="vim +PlugUpgrade +CocUpdate +PlugUpdate +UpdateRemotePlugins"
    alias upall="up && upconda && upvim"
    alias rambox="/home/ben/.programs/rambox/rambox-0.7.3.Appimage"
    alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
    alias watchman_reset="watchman watch-del-all && watchman shutdown-server"
fi

if [ $USER = "schmidt" ]; then
    alias "vim=/local_data/.programs/nvim.appimage"
    # alias "python=/usr/bin/python3"
    alias "qtipdata=cd /sim/wrf/datasets/qtip/"
    alias "qtipwdir=cd /local_data/wrf/qtip/wdir"
    alias "qtipproducts=cd /local_data/wrf/qtip/products"
    alias "qtipforcing=cd /sim/forcing_data/GCM/"
    alias "qtipgps=cd /local_data/gps/qtip/"
    alias idl="/usr/local/harris/idl87/bin/idl"
    alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
fi

alias isntall="install"
