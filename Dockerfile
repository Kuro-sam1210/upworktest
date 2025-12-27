# Use Node.js 18 Alpine as base image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files
COPY package.json pnpm-lock.yaml ./

# Install pnpm globally and install dependencies
RUN npm install -g pnpm && pnpm install

# Copy the rest of the application code
COPY . .

# Ensure .env file exists (you need to create it with your API key)
# For testing, you can set GRAPH_API_KEY as an environment variable
ENV GRAPH_API_KEY=${GRAPH_API_KEY}

# Run the script
CMD ["node", "fetch-aave-proposal.mjs"]