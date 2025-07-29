FROM node:20 as builder
WORKDIR /app
COPY . .
RUN npm ci
RUN npm build

FROM nginx:1.27-alpine

COPY --from=builder dist /usr/share/nginx/html

#FROM nginx:1.27-alpine
#COPY dist /usr/share/nginx/html