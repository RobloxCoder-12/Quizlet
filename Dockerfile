# Use an official Nginx image as a base
FROM nginx:alpine

# Remove default nginx index.html
RUN rm -rf /usr/share/nginx/html/*

# Copy the home.html from the current directory into the container's html directory
COPY home.html /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 80

