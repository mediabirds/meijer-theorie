FROM directus/directus:11.4.1

## Install SQLite SpatiaLite: extend the SQLite core to support fully fledged Spatial SQL
## capabilities.
## https://pkgs.alpinelinux.org/package/edge/community/x86/libspatialite

USER root
RUN npm install -g corepack@latest && \
    corepack enable && \
    pnpm --version

USER node
RUN pnpm install directus-extension-group-tabs-interface
RUN pnpm install directus-extension-computed-interface

USER root
RUN <<EOF
  apk --no-cache add libspatialite
  ln -s mod_spatialite.so.8 /usr/lib/mod_spatialite
EOF
USER node