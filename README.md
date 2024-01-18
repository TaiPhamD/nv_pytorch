# Overview
This project is to setup a simple dev environemnt to utilize Nvidia's Pytorch container. The image has a few addons from the stock Nvidia image:
- Setup launching of container using compose yaml which is more readable than the stock nvidia docker run command
- Add the recommended nvidia docker run command: `docker run --gpus all --ipc=host --ulimit memlock=-1 --ulimit stack=67108864 `
- Mount ./data to /workspace/data so the user can have easy access to their data
- Starts tensorboard on port 6006 mapping to ./data/tensorboard_runs :/workspace/data/tensorboard_runs
- Includes a simple MNIST example to show case the container includig Tensorboard logging

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
