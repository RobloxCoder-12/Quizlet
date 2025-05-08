# Use Node.js 18 LTS version as base image
FROM node:18

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application
COPY . .

# Expose the application's port (adjust as needed, e.g., 3000)
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
