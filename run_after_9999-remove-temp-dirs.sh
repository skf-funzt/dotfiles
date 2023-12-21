#!/bin/bash

# Remove the temporary directory
rm -rf ./tmp || true

# Remove all the temporary directories even in subdirectories
find . -type d -name "tmp" -exec rm -rf {} \; || true
