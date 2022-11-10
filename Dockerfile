FROM node:19-slim

LABEL version="3.0.0"
LABEL repository="http://github.com/calibreapp/github-actions"
LABEL homepage="http://github.com/calibreapp/github-actions"
LABEL maintainer="Calibre <hello@calibreapp.com>"

LABEL "com.github.actions.name"="calibreapp/github-actions"
LABEL "com.github.actions.description"="Wraps the Calibre CLI to enable common commands."
LABEL "com.github.actions.icon"="bar-chart-2"
LABEL "com.github.actions.color"="blue"
COPY LICENSE README.md /

RUN yarn global add calibre

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
