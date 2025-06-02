# Use the official Nginx image
FROM nginx:alpine

# Remove the default static assets
RUN rm -rf /usr/share/nginx/html/*

# Copy your HTML file into the Nginx html directory
COPY login.html /usr/share/nginx/html/index.html

# Expose port (Cloud Run expects the container to listen on 8080)
EXPOSE 8080

# Change Nginx to listen on port 8080 (Cloud Run requirement)
RUN sed -i 's/80;/8080;/g' /etc/nginx/conf.d/default.conf

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
