# Use official Node image
FROM node:14

# Install Meteor
RUN curl https://install.meteor.com/ | sh

# Set working directory
WORKDIR /app

# Copy app files
COPY . /app

# Install NPM dependencies
RUN meteor npm install

# Expose port
EXPOSE 3000

# Start Meteor
CMD ["meteor", "run", "--port", "3000", "--allow-superuser"]
