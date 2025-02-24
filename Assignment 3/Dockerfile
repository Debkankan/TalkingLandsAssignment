FROM python:3.8-slim

# Setting up working directory in container
WORKDIR /app

# Copying the application code into the container
COPY app.py /app/

# Installing dependencies
RUN pip install flask

# Exposing the port the app runs on
EXPOSE 5000

# Running the Python application
CMD ["python", "app.py"]
