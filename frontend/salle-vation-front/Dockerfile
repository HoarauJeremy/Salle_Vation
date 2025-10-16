FROM node:lts-bookworm

USER node
WORKDIR /var/www

COPY --chown=node:node package.json package-lock.json ./
RUN npm ci

COPY --chown=node:node . .

EXPOSE 3000

ENV HOST=0.0.0.0
CMD [ "npm", "run", "dev", "--", "--host", "0.0.0.0" ]