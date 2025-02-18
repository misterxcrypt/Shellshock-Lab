# Use Ubuntu 14.04 as the base image
FROM ubuntu:14.04

# Set non-interactive mode to avoid prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN apt update && apt install -y \
    apache2 \
    bash \
    wget \
    curl \
    build-essential

# Download and install Bash 4.2 (vulnerable version)
RUN wget http://ftp.gnu.org/gnu/bash/bash-4.2.tar.gz && \
    tar -xzf bash-4.2.tar.gz && \
    cd bash-4.2 && \
    ./configure && make && make install && \
    cd .. && rm -rf bash-4.2*

# Enable CGI module and configure Apache
RUN a2enmod cgi && \
    mkdir -p /usr/lib/cgi-bin && \
    chmod +x /usr/lib/cgi-bin


# Add the vulnerable CGI script
COPY vuln.sh /usr/lib/cgi-bin/vuln.sh
RUN chmod +x /usr/lib/cgi-bin/vuln.sh

# Copy the HTML file into Apache's web directory
COPY index.html /var/www/html/index.html

# Expose port 8080 for Apache
EXPOSE 8080

# Start Apache in foreground mode
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
