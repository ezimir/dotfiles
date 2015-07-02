#!/bin/bash

for filename in .vim .vimrc
do
    if [ -d ~/$filename ] || [ -f ~/$filename ];
    then
        echo "~/$filename already exists."
        ls -la ~/$filename
    else
        ln -s ${PWD}/$filename ~/$filename
        echo "~/$filename linked"
    fi
done
