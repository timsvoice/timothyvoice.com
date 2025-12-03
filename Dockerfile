# Build stage
FROM alpine:3.19 AS builder

# Install Hugo Extended
RUN apk add --no-cache \
    wget \
    ca-certificates \
    libc6-compat \
    libstdc++

# Download and install Hugo Extended
RUN wget -O hugo.tar.gz https://github.com/gohugoio/hugo/releases/download/v0.152.2/hugo_extended_0.152.2_linux-amd64.tar.gz && \
    tar -xzf hugo.tar.gz && \
    mv hugo /usr/local/bin/ && \
    rm hugo.tar.gz

WORKDIR /src
COPY . .

RUN hugo --minify

# Serve stage
FROM nginx:alpine

# Copy built site from builder
COPY --from=builder /src/public /usr/share/nginx/html

# Copy custom nginx configuration
COPY .docker/nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
