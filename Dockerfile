# Use official Nginx image
FROM nginx:alpine

# Remove default index.html if it exists
RUN rm -rf /usr/share/nginx/html/*

# Copy your local home.html as index.html into the container
COPY public/home.html /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 80


# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]

