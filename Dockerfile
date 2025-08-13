# Use Node.js LTS image
FROM node:18

# Create app directory
WORKDIR /usr/src/app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy app source code
COPY . .

# Expose app port
EXPOSE 8080

# Start the app
CMD ["node", "app.js"]
