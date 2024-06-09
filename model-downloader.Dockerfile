FROM python:3.10-slim
USER root
RUN apt-get update &&  apt-get install -y --no-install-recommends libsndfile1-dev espeak-ng time git g++ cmake pkg-config openssh-client git && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN pip install --no-cache-dir 'torch' --index-url https://download.pytorch.org/whl/cpu && pip install --no-cache-dir transformers
ENV HF_ENDPOINT https://hf-mirror.com
ENV MODEL_NAME Qwen/Qwen2-0.5B
ENV TARGET_CACHE /cache
COPY model-downloader.py .
CMD [ "python", "model-downloader.py" ]