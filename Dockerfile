FROM python:3.9-slim
WORKDIR /app
COPY . .
RUN pip install -r requirements.txt
CMD ["python", "app.py"]
RUN apt-get update && apt-get install -y python3 python3-pip python3-venv

FROM jenkins/jenkins:lts
USER root
RUN apt-get update && apt-get install -y python3 python3-pip
python3 -m venv venv
