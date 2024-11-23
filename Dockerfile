# Use an official Node.js runtime as a base image
FROM node:14

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json /app/

# Copy the rest of the application files
COPY . /app/

# Expose the application port
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
