FROM node:alpine as builderr
WORKDIR '/app'
copy package.json .
run npm install
copy . .
run npm run build

from nginx
COPY --from=builderr /app/build /usr/share/nginx/html


