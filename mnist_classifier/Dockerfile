FROM tensorflow/tensorflow:nightly

COPY classifier.py  distributed_classifier.py  distri_go.sh  main.py  mnist_data.py  /
ENTRYPOINT ["sh", "distri_go.sh"]
