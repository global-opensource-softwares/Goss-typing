# Use an official Node.js 20 runtime as a parent image
FROM node:20

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json (if you have one) to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of your application code to the working directory
COPY . .

# Build the frontend assets
RUN cd frontend && npm run build:live

# Expose port 8080
EXPOSE 8080

# Define the command to run your app
CMD ["npm", "start:dev"]

