# create an image from nvcr.io/nvidia/pytorch:23.12-py3
FROM nvcr.io/nvidia/pytorch:23.12-py3

# create a directory called data under /home/
RUN mkdir -p /workspace/data/tensorboard_runs/

RUN echo "#!/bin/bash"  >> /usr/bin/start.sh 
# echo tensorboard --logdir=/path/to/tensorboard/logs --port 6006 &
RUN echo "tensorboard --logdir=/workspace/data/tensorboard_runs --port 6006 &" >> /usr/bin/start.sh
# exec jupyter notebook --port=8888 --no-browser --ip=0.0.0.0
RUN echo "exec jupyter notebook --port=8888 --no-browser --ip=0.0.0.0" >> /usr/bin/start.sh
RUN chmod +x /usr/bin/start.sh

# may want to wrap tiny : https://jupyter-notebook.readthedocs.io/en/4.x/public_server.html
ENV TINI_VERSION v0.9.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN chmod +x /usr/bin/tini
ENTRYPOINT ["/usr/bin/tini", "--"]

EXPOSE 8888 6006
CMD ["/usr/bin/start.sh"]


