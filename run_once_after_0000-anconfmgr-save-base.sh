#!/bin/bash

# Copy the file to .config/aconfmgr
# cp ./01-base-packages.sh ./.config/01-base-packages.sh

aconfmgr save

# Move the file
mv .config/aconfmgr/99-unsorted.sh .config/aconfmgr/01-base-packages.sh
