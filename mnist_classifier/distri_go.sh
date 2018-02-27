#!/usr/bin/sh

# Now set env like:
# export TF_CONFIG='{"ps":["ps1.example.com:2222","ps2.example.com:2222"],"worker":["worker1.example.com:2222"],"task":{"type":"ps","index":0}}'

# Parameter Server 1:

python tfconfig_wrapper.py --data_dir=./data/

# Parameter Server 2:

python tfconfig_wrapper.py  --data_dir=./data/


# Worker 1

python tfconfig_wrapper.py  --data_dir=./data/

# Worker 2

python tfconfig_wrapper.py --data_dir=./data/

