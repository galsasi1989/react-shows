FROM node:13.8.0-alpine

ENV USERNAME reactUser
RUN adduser -D -s /bin/sh -h /home/${USERNAME} ${USERNAME}

WORKDIR /home/${USERNAME}
COPY . .

RUN apk update && \
    apk add yarn && \
    yarn global add serve && \
    yarn install && \
    yarn build && \
    chown -R ${USERNAME}:${USERNAME} /home/${USERNAME}

EXPOSE 5000
USER ${USERNAME}

ENTRYPOINT ["serve", "-s", "build"]
