
#As specifies the phase
FROM node:alpine as builder 
WORKDIR /app
COPY ./package.json ./
RUN npm install
COPY ./ ./
RUN npm run build

#Specifies the start of a new block
FROM nginx 

#Copy from previous phase, copy the folder and paste it in the location
COPY --from=builder /app/build /usr/share/nginx/html
