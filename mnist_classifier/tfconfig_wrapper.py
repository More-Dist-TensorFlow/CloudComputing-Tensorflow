#!/usr/bin/env python3
import os, json
import sys
import logging
import subprocess

old_args = []
for arg in sys.argv:
    if not 'ps_hosts=' in arg and not 'worker_hosts=' in arg:
        old_args.append(arg)

tf_config_json = os.environ.get("TF_CONFIG", "{}")
tf_config = json.loads(tf_config_json)

worker = tf_config.get("worker", {})
arg_ = 'worker_hosts=' + ','.join(worker)
old_args.append(arg_)

ps = tf_config.get("ps", {})
arg_ = 'ps_hosts=' + ','.join(ps)
old_args.append(arg_)

old_args[0] = 'distributed_classifier.py'
old_args = ['python'] + old_args
print('Running:', old_args)
completed = subprocess.run(old_args, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

exit(completed.returncode)
