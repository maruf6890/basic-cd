
FROM node:20-alpine

# 2. Set the working directory inside the container
WORKDIR /usr/src/app

# 3. Copy dependency files first (optimizes layer caching)
COPY package*.json ./

# 4. Install only production dependencies (change to 'npm install' if devDeps are needed)
RUN npm ci --only=production

# 5. Copy the remaining application source code
COPY . .

# 6. Inform Docker which port the app listens on at runtime
EXPOSE 3000

# 7. Define the default command to start your application
CMD ["node", "server.js"]