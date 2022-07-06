#!/bin/bash

mkdir lrharvester
cd lrharvester || exit
git clone https://github.com/lareferencia/lareferencia-platform.git
cd lareferencia-platform || exit
bash pull_and_build.sh ibict