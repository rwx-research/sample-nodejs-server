FROM docker.io/library/node:22-alpine

RUN mkdir -p /app
WORKDIR /app

ENV PORT=3000

COPY index.cjs ./

HEALTHCHECK --interval=1s --timeout=1s --retries=10 \
  CMD wget --no-verbose --spider --tries=1 "http://localhost:${PORT}/" || exit 1

EXPOSE 3000
CMD ["node", "index.cjs"]
