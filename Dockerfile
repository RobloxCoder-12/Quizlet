# Base image from official Node.js LTS version
FROM node:18

# Set working directory inside container
WORKDIR /app

# Copy package.json and package-lock.json first to install dependencies
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the entire application source code
COPY . .

# Expose the port your app runs on (adjust if needed)
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
