#!/usr/bin/env bash

######################
# Link current machine

## Check args
if [ "$#" -ne 1 ]
then
    target_machine=`hostname`
else
    target_machine=$1
fi

## Check folders
if [ ! -d "machines/$target_machine" ]
then
    echo "Directory machines/$target_machine is missing";
    exit 1;
fi

## Link to machine
rm -f machines/local
ln -s $target_machine machines/local
