#!/bin/bash -x

cd /host/egpg/tests/
sudo -h 127.0.0.1 -H -u developer ./run.sh "$@"
