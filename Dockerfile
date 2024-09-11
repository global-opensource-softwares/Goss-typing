# Use Node.js 20 as the base image
FROM node:20

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY ./    ./

# Install dependencies for the frontend
RUN cd frontend && npm install

# Copy the rest of the frontend files

# Debugging step: List files in the frontend directory
RUN ls -al frontend

# Run the build command
RUN cd frontend && npm run build:live

# Expose the port
EXPOSE 8080

# Command to run the application
CMD ["npm", "start:dev"]

