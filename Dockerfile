FROM nvidia/cuda:12.3.2-devel-ubuntu20.04

ARG DEBIAN_FRONTEND=noninteractive 

SHELL [ "/bin/bash" , "-c" ]	

ENV NVIDIA_VISIBLE_DEVICES all 
ENV NVIDIA_DRIVER_CAPABILITIES compute,video , utility

RUN apt update -y \
&& apt upgrade -y \ 
&& apt install libaio-dev-y \
&& apt install libaio1 -y 

RUN apt install python3.11.7 -y \
&& apt install python3-pip -y \ 
&& apt install python-is-python3 -y 


RUN pip install datasets\
pip install transformers\
&& pip install accelerate\
&& pip install sentencepiece\
&& pip install llama-recipes\
&& pip install protobuf==3.20\
&& pip install py7zr\
&& pip install scipy\
&& pip install peft\
&& pip install bitsandbytes\
&& pip install fire\
&& pip install torch_tb_profiler\
&& pip install ipywidgets

#RUN pip install triton == 1.0.0

RUN DS_BUILD_OPS=1 pip install git+https://github.com/microsoft/DeepSpeed.git

RUN pip install deepspeed-mii 

RUN pip install wandb 

WORKDIR /workspace