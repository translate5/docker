FROM php:7.4-apache
LABEL maintainer "support@translate5.net"

# System dependencies
RUN set -eux; \
    \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        unzip \
        mariadb-client \
    ; \
    rm -rf /var/lib/apt/lists/*
    
    
# # Install PHP extensions
# RUN set -eux; \
#     \
#     savedAptMark="$(apt-mark showmanual)"; \
#     \
#     apt-get update; \
#     apt-get install -y --no-install-recommends \
#         libcurl4-openssl-dev \
#         libfreetype6-dev \
#         libicu-dev \
#         libjpeg-dev \
#         libmagickwand-dev \
#         libpng-dev \
#         libzip-dev \
#     ; \
#     \
#     docker-php-ext-install -j "$(nproc)" \
#         curl \
#         dom \
#         gd \
#         intl \
#         json \
#         mbstring \
#         mysqli \
#         opcache \
#         zip \
#     ; \
#     \
#     # reset apt-mark's "manual" list so that "purge --auto-remove" will remove all build dependencies
#     apt-mark auto '.*' > /dev/null; \
#     apt-mark manual $savedAptMark; \
#     ldd "$(php -r 'echo ini_get("extension_dir");')"/*.so \
#         | awk '/=>/ { print $3 }' \
#         | sort -u \
#         | xargs -r dpkg-query -S \
#         | cut -d: -f1 \
#         | sort -u \
#         | xargs -rt apt-mark manual; \
#     \
#     apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false; \
#     rm -rf /var/lib/apt/lists/*
    
# translate5 setup
COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]
