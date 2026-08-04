FROM node:18
ENV METEOR_ALLOW_SUPERUSER=true

# Install Meteor
RUN curl https://install.meteor.com/ | sh

# Set working directory
WORKDIR /app

# Copy app files
COPY . /app

# Make build script executable
RUN chmod +x build.sh

# Install dependencies
RUN meteor npm install

# Build Meteor bundle
RUN ./build.sh

# Move into the built bundle
WORKDIR /build-output/bundle

# Install Node dependencies for the built app
RUN (cd programs/server && npm install)

# Expose port
EXPOSE 3000

# Start the Node server
CMD ["node", "main.js"]
