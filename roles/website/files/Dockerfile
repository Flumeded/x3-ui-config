# Use the official NGINX image
FROM nginx:latest

# Copy all site pages (HTML & CSS) to the default NGINX directory
COPY index.html /usr/share/nginx/html/
COPY myfiles.html /usr/share/nginx/html/
COPY upload.html /usr/share/nginx/html/
COPY settings.html /usr/share/nginx/html/
COPY style.css /usr/share/nginx/html/
COPY default.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]