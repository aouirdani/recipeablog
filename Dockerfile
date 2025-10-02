FROM ghost:5-alpine

WORKDIR /var/lib/ghost

EXPOSE 2368

ENV NODE_ENV=production

CMD ["node", "current/index.js"]
