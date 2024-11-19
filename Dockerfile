# Use an official Golang image as the base
FROM golang:1.22 AS builder

# Set the working directory
WORKDIR /app

# Copy Go modules and download dependencies
COPY go.mod ./
RUN go mod download

# Copy the rest of the application
COPY . .

# Build the Go app
RUN go build -o static-app

# Expose the app's port
EXPOSE 8080

# Command to run the application
CMD ["./static-app"]
