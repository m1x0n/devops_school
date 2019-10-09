FROM docker:dind

RUN addgroup -S matrix && adduser -S neo -u 1001 -G matrix

RUN mkdir share && chown -R neo:matrix share

ENTRYPOINT ["dockerd-entrypoint.sh"]
CMD []
