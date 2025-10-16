FROM node:lts-alpine   

WORKDIR /var/www

RUN npm create vite@latest my-project -- --template react-ts
RUN npm install tailwindcss @tailwindcss/vite


