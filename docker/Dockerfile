# -----------------------------
# Stage 1: Build React App
# -----------------------------
FROM node:18-alpine AS build

WORKDIR /app

# Copy dependency files
COPY app/package.json app/package-lock.json* ./

# Install dependencies
RUN npm install

# Copy source code
COPY app/ .

# Build production-ready static files
RUN npm run build


# -----------------------------
# Stage 2: Nginx for Production
# -----------------------------
FROM nginx:alpine

# Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*

# Copy build output from previous stage
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
