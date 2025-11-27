FROM httpd:2.4-alpine

# Create web user and group
RUN addgroup -g 1001 -S webgroup && \
    adduser -u 1001 -G webgroup -h /var/www -S webuser

# Copy HTML files to /var/www/html/
COPY html/ /usr/local/apache2/htdocs/

# Switch to root for config and permissions
USER 0

# Change Apache listen port to 8080
RUN sed -i 's/^Listen 80/Listen 8080/' /usr/local/apache2/conf/httpd.conf

# Add ServerName directive to suppress the warning
RUN echo "ServerName localhost" >> /usr/local/apache2/conf/httpd.conf

# Create logs directory with proper permissions
RUN mkdir -p /usr/local/apache2/logs && \
    chown -R 1001:1001 /usr/local/apache2/logs && \
    chmod -R 755 /usr/local/apache2/logs

# Set ownership and permissions on entire /var/www/html/
RUN chown -R 1001:1001 /usr/local/apache2/htdocs/ && chmod -R 755 /usr/local/apache2/htdocs/

# Switch to non-root user
USER 1001

# Expose Apache port 8080
EXPOSE 8080
