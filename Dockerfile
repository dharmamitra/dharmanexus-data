FROM alpine:latest
RUN apk add --no-cache git
COPY init-repos.sh /init-repos.sh
RUN chmod +x /init-repos.sh
CMD ["/init-repos.sh"]