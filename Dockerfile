FROM pytorch/pytorch:2.2.1-cuda12.1-cudnn8-runtime

RUN pip install --upgrade pip

WORKDIR /workspace

COPY requirements.txt /workspace/


RUN pip install --no-cache-dir -r requirements.txt




