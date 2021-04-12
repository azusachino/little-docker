FROM python:3.9
LABEL maintaner="az"
COPY . /app
WORKDIR /app
# using exec rather than shell, safer
RUN ["pip", "install", "flask", "redis"]
EXPOSE 5000
CMD ["python", "app.py"]