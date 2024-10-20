FROM node:16-alpine AS builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . . 
RUN npm run build
#in the container the /app/build folder 
#will contain all the files we want for 
#our nginx app

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html