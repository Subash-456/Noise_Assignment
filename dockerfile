# Use the Nginx base image
FROM nginx:latest

# Copy your HTML files to Nginx's default public directory
COPY index.html /usr/share/nginx/html

# Expose port 80 to allow incoming traffic
EXPOSE 80
