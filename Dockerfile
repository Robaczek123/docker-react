# Use an existing docker image as a base
FROM node:16-alpine AS builder

WORKDIR '/app'

# Download and install a dependency

COPY ./package.json ./
RUN npm install
COPY ./ ./

# Tell the image what to do when it starts
# as a container
# CMD ["npm","run","start"]

RUN npm run build

# /app/build is used

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html


