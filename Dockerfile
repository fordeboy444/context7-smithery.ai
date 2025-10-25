# syntax=docker/dockerfile:1
FROM node:20-alpine
WORKDIR /app
COPY package*.json ./
RUN npm ci --omit=dev
COPY . .
RUN npm run build || true
ENV NODE_ENV=production
CMD ["npm","run","start:stdio"]
