FROM alpine

ENV HUGO_VERSION hugo_0.15_linux_amd64
ADD https://github.com/spf13/hugo/releases/download/v0.15/hugo_0.15_linux_amd64.tar.gz /tmp/hugo.tar.gz

RUN tar -zxvf /tmp/hugo.tar.gz -C /tmp && \
    cp /tmp/$HUGO_VERSION/$HUGO_VERSION /usr/local/bin/hugo

COPY ./public /blog/public
WORKDIR /blog

ENTRYPOINT ["hugo"]
CMD ["server"]
