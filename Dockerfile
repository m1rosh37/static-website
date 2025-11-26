# Use Nginx as the base image
FROM nginx:alpine

# Remove default nginx html content
RUN rm -rf /usr/share/nginx/html/*

# Copy only the necessary static files
COPY index.html 404.html style.css script.js /usr/share/nginx/html/

# Add custom nginx config (for 404 handling, etc.)
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80 (inside the container)
EXPOSE 80

# Run nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
