FROM continuumio/miniconda3:latest

WORKDIR /app

RUN apt-get update
RUN apt-get install package_name -y

COPY . .

RUN conda env create -f conda-environment.yml

SHELL ["conda", "run", "-n", "environment_name", "/bin/bash", "-c"]

CMD ["conda", "run", "--no-capture-output", "-n", "environment_name", "python3", "-m", "flask", "run", "--host=0.0.0.0", "--port=80"]
