# Use official NGINX image
FROM nginx:alpine

# Remove the default nginx website
RUN rm -rf /usr/share/nginx/html/*

# Copy your website to nginx's public directory
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 80

