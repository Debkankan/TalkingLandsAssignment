# Official Node.js image from Docker Hub
FROM node:16-alpine

# Setting the working directory in the container
WORKDIR /app

# Copying the package.json and package-lock.json to the container
COPY package*.json ./

# Installing dependencies
RUN npm install

# Copying the rest of the application
COPY . .

# Exposing the port the app will run on
EXPOSE 3000

# Executing command to run the app
CMD ["npm", "start"]
