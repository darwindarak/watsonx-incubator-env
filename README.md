# Docker Image for IBM Watsonx Incubation Program

[<img src="https://img.shields.io/docker/image-size/darwindarak/watsonx-incubator-env">](https://hub.docker.com/r/darwindarak/watsonx-incubator-env)

This repo is used for building a container [image](https://hub.docker.com/r/darwindarak/watsonx-incubator-env) that contains the Python tools & libraries needed to run the [labs](https://github.com/edsml-kl121/gen_ai_incubation_watsonx_th) for the IBM Watsonx Incubator/Pilot/Hackathon programs.

## Prerequisites

- `docker` (**required**) or compatible container runtime
- `git` (*optional*)

## Usage

We first need to get the `edsml-kl121/gen_ai_incubation_watsonx_th` lab repository from GitHub either using `git`
```bash
git clone git@github.com:edsml-kl121/gen_ai_incubation_watsonx_th.git
```
or [download](https://github.com/edsml-kl121/gen_ai_incubation_watsonx_th/archive/refs/heads/main.zip) the entire repository as a zip file.

The repository has three types of labs:
- Jupyter notebooks (labs 1-4)
- Streamlit applications (lab 5)
- Streamlit applications with vector database (labs 6+)

### Running Jupyter Notebook

```bash
# Move to the repo (might be named differently based on how you cloned it)
cd gen_ai_incubation_watsonx_th
# The default command for the container is to run a Jupyter notebook, the
# arguments do the following:
# - remove the container when we stop it
# - gives Jupyter notebook access to the cloned notebooks
# - provide access to Jupyter lab through port 8888
docker run \
  --rm \
  -v .:/home/lab/notebooks \
  -p 8888:8888 \
  darwindarak/watsonx-incubator-env
```

### Running Streamlit Applications

```bash
# Move to the repo (might be named differently based on how you cloned it)
cd gen_ai_incubation_watsonx_th
# We will override the default Jupyter notebook command and run streamlit instead.
# The arguments do the following:
# - remove the container when we stop it
# - gives Streamlit access to the cloned notebooks
# - provide access to the Streamlit app through port 8510
# - specify the container image
docker run \
  --rm \
  -v ./:/home/lab/notebooks \
  -p 8501:8510 \
  darwindarak/watsonx-incubator-env \
  streamlit run "/home/lab/notebooks/TH/lab 05- Building Question-Answering with watsonx.ai and Streamlit/Level_1_English/app.py"
```

## Todo

- [x] Make the Dockerfile
- [ ] Add instructions for connecting local dev environment (e.g. VSCode) to the container
- [x] Add instructions for how to access Jupyter environment & Streamlit app in the container
- [ ] Add pipeline to build packages for both `amd64` and `aarch64` architectures
