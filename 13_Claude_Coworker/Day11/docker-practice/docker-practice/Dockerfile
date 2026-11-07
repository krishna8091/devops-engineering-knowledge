FROM ubuntu:latest
RUN apt-get update
RUN apt-get install -y python3 python3-pip build-essential git curl vim wget
COPY . /app
WORKDIR /app
ENV SECRET_KEY=FAKE-supersecret-123
RUN pip3 install -r requirements.txt --break-system-packages
EXPOSE 22 5000
CMD python3 app.py
