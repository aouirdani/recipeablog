FROM ghost:5-alpine

# Set working directory
WORKDIR /var/lib/ghost

# Create necessary directories
RUN mkdir -p content/themes content/images content/files content/apps content/data content/logs content/adapters content/settings

# Set proper permissions
RUN chown -R node:node /var/lib/ghost/content

# Switch to node user
USER node

# Expose Ghost port
EXPOSE 2368

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=30s \
  CMD node -e "require('http').get('http://localhost:2368/ghost/api/v4/admin/site/', (r) => {process.exit(r.statusCode === 200 ? 0 : 1)})"

# Start Ghost
CMD ["node", "current/index.js"]
