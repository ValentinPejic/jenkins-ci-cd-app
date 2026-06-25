#!/bin/bash

if [ -f Dockerfile ]; then
    echo "Dockerfile exists"
    exit 0
else
    echo "Dockerfile missing"
    exit 1
fi
