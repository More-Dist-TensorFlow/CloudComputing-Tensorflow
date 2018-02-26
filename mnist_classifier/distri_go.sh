#!/usr/bin/sh
# Parameter Server 1:

python distributed_classifier.py --job_name=ps --task_index=0 --ps_hosts=0.0.0.0:2333,0.0.0.0.0:2224     --worker_hosts=0.0.0.0:2344,0.0.0.0:2345 --data_dir=./data/ &

# Parameter Server 2:

python distributed_classifier.py --job_name=ps --task_index=1 --ps_hosts=0.0.0.0:2333,0.0.0.0.0:2224 --worker_hosts=0.0.0.0:2344,0.0.0.0:2345 --data_dir=./data/


# Worker 1

python distributed_classifier.py --job_name=worker --task_index=0 --ps_hosts=0.0.0.0:2333,0.0.0.0.0:2224 --worker_hosts=0.0.0.0:2344,0.0.0.0:2345 --data_dir=./data/

# Worker 2

python distributed_classifier.py --job_name=worker --task_index=1 --ps_hosts=0.0.0.0:2333,0.0.0.0.0:2224 \
    --worker_hosts=0.0.0.0:2344,0.0.0.0:2345 --data_dir=./data/

