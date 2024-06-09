FROM python:3.10-slim
USER root
RUN pip install --no-cache-dir 'torch' --index-url https://download.pytorch.org/whl/cpu && pip install --no-cache-dir transformers
ENV HF_ENDPOINT https://hf-mirror.com
ENV MODEL_NAME Qwen/Qwen2-0.5B
ENV TARGET_CACHE /my-cache
COPY model-downloader.py .
CMD [ "python", "-u", "model-downloader.py" ]