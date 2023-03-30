FROM alpine:3.15
ARG TARGETPLATFORM

RUN apk add --no-cache curl gcompat libstdc++ libgcc openssl && \
    case "$TARGETPLATFORM" in \
        linux/amd64) export DOTE=dote_linux ;; \
        linux/arm64) export DOTE=dote_arm64 ;; \
        *) exit 1 ;; \
    esac; \
    curl -sSLo /opt/dote https://github.com/chrisstaite/DoTe/releases/latest/download/$DOTE && \
    chmod +x /opt/dote && \
    apk del curl

ENTRYPOINT [ "/opt/dote" ]
