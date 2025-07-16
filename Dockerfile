# Use the official Go image as the base image
FROM golang:1.21-alpine

# Install git and ca-certificates (needed for go mod download)
RUN apk add --no-cache git ca-certificates

# Set the working directory
WORKDIR /app

# Copy go mod and sum files
COPY go.mod go.sum ./

# Download dependencies (simplified)
RUN go mod download

# Copy the source code
COPY . .

# Build the application
RUN go build -o main .

# Expose port 8080
EXPOSE 8080

# Run the application
CMD ["./main"] 