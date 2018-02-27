#!/usr/bin/sh

# Now set env like:
# export TF_CONFIG='{"ps":["ps1.example.com:2222","ps2.example.com:2222"],"worker":["worker1.example.com:2222"]}'

# Parameter Server 1:

python tfconfig_wrapper.py --job_name=ps --task_index=0  --data_dir=./data/

# Parameter Server 2:

python tfconfig_wrapper.py --job_name=ps --task_index=1 --ps_hosts=this_arg_is_ignored_now --worker_hosts=and_so_do_this_one --data_dir=./data/


# Worker 1

python tfconfig_wrapper.py --job_name=worker --task_index=0 --data_dir=./data/

# Worker 2

python tfconfig_wrapper.py --job_name=worker --task_index=1  --data_dir=./data/

