#!/bin/bash

# - must have Cython installed
# - must have already run:
#     mkdir cbuild
#     (cd cbuild && cmake .. && make -j 4 )
# - torch is expected to be already activated, ie run:
#    source ~/torch/install/bin/torch_activate.sh
#    ... or similar
# - torch is expected to be at $HOME/torch

rm -Rf build PyBuild.so dist *.egg-info cbuild
python setup.py build_ext -i || exit 1
mkdir cbuild
(cd cbuild; cmake .. -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=$HOME/torch/install && make -j 4 install) || exit 1

