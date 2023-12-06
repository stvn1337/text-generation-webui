FROM base AS llama-cpu
RUN echo "LLAMA-CPU" >> /variant.txt
RUN apt-get install --no-install-recommends -y git python3-dev build-essential python3-pip
RUN unset TORCH_CUDA_ARCH_LIST LLAMA_CUBLAS
RUN pip uninstall -y llama_cpp_python_cuda llama-cpp-python && pip install llama-cpp-python --force-reinstall --upgrade
ENV EXTRA_LAUNCH_ARGS=""
CMD ["python3", "/app/server.py", "--cpu"]

FROM base AS default
RUN echo "DEFAULT" >> /variant.txt
ENV EXTRA_LAUNCH_ARGS=""
CMD ["python3", "/app/server.py"]
