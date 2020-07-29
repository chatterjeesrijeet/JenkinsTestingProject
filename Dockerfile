#import the python and the OS along with it as a docker image 
FROM python:3.8.5-alpine3.12

# Set the working directory.
WORKDIR /myWorkDir

#Install dependencies
RUN pip install -r requirements.txt

# Copy the file from your host to your current location.
COPY requirements.txt .
COPY src/ .

# Run the specified command within the container.
CMD ["python", "./app.py"]
