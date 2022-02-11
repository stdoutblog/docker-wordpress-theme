FROM wordpress:latest
WORKDIR /var/lib/apt/lists
RUN apt-get update && apt-get install -y --no-install-recommends \
  wget \
  unzip \
  && wget https://downloads.wordpress.org/plugin/theme-check.zip \
  && wget https://downloads.wordpress.org/plugin/contact-form-7.zip \
  && unzip './*.zip' -d /usr/src/wordpress/wp-content/plugins \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && chown -R www-data:www-data /usr/src/wordpress/wp-content
WORKDIR /var/www/html
