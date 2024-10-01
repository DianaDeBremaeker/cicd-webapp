# Start from a Node.js image
FROM node:alpine3.20

# Copy package.json and yarn.lock files to the container
COPY package.json yarn.lock ./

# Set the working directory inside the container to /app
WORKDIR /app

# Copy package.json and yarn.lock first to install dependencies (this helps with Docker layer caching)
COPY package.json yarn.lock ./

# Install dependencies using yarn and ensure it uses the frozen lockfile option
RUN yarn install --frozen-lockfile

# Copy the rest of the application code to the /app folder
COPY . .

# Expose port 3000, as the application will be reachable on this port
EXPOSE 3000

# 7. Command to start the application when the container starts
CMD ["yarn", "start"]
