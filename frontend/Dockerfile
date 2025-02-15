
# Use Node.js for building the React app
FROM node:18-alpine AS builder

# Set work directory
WORKDIR /app

# Copy package.json and package-lock.json first for caching
COPY package.json ./

# Install dependencies
RUN npm install

# Copy the rest of the project files
COPY . .

# Build the React app
RUN npm run build

# Use Nginx as the final image to serve the React app
FROM nginx:alpine

# Copy built files from the builder stage
COPY --from=builder /app/build /usr/share/nginx/html

# Expose Nginx default port
EXPOSE 80

# Set a non-root user
# RUN adduser -D appuser
# USER appuser
RUN touch /var/run/nginx.pid
RUN chown -R nginx:nginx /var/run/nginx.pid /usr/share/nginx/html /var/cache/nginx /var/log/nginx /etc/nginx/conf.d
USER nginx

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
