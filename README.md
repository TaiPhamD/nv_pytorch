# Overview
This docker image provides a simple environment to more easily utilize Nvidia's Pytorch container. The project has a few advantages compared to the stock Nvidia image:
- Setup launching of container using docker-compose.yml which is more readable than the stock nvidia docker run command
- Add the equivalence of the recommended nvidia docker run command: `docker run --gpus all --ipc=host --ulimit memlock=-1 --ulimit stack=67108864` in the docker-compose.yml format
- Mount ./data to /workspace/data so the user can have easy access to their data
- Starts tensorboard on port 6006 mapping to ./data/tensorboard_runs :/workspace/data/tensorboard_runs
- Includes a simple MNIST example to show case the using nvidia/pytorch:23.12-py3 container with Tensorboard logging

# Pre-requisites
- Docker
- CUDA capable GPU & drivers
- Nvidia docker runtime

# Usage
- Clone this repo
- Run `docker compose up -d` to build and launch the container
   - localhost:8888 will allow you to access the jupyter notebook
       - run `docker compose logs nv_pytorch | grep token  ` to get the token to log into jupyter notebook
   - localhost:6006 will allow you to access tensorboard
- Run `docker compose down` to stop the container