FROM avvo/ruby
MAINTAINER Jeff Ching <ching.jeff@gmail.com>

RUN apk update && \
    apk upgrade && \
    apk add ruby-json && \
    rm -rf /var/cache/apk/*

# bust cache when the version changes
ADD lib/rancher/management_api/version.rb /tmp/
RUN gem install -N rancher-management_api

ENTRYPOINT ["rancher-management"]
