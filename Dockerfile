#import the python and the OS along with it as a docker image 
FROM python:3.8.5-alpine3.12

# Set the working directory.
WORKDIR /myWorkDir

# Copy the file from your host to your current location.
COPY requirements.txt .
COPY ./src/ /myWorkDir

#Install dependencies
RUN pip install -r requirements.txt

# Run the specified command within the container.
CMD ["python", "./app.py"]
