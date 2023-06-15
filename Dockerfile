FROM ubuntu:22.04

ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV JEKYLL_ENV development

RUN apt-get update \
  && apt-get -y install ruby ruby-dev make git gcc g++ \
  && gem install bundler:2.3.13 \
  && useradd -ms /bin/bash -d /var/cerb-docs/ jekyll \
  && rm -rf /var/lib/apt/lists/*

COPY Gem* /var/cerb-docs/

WORKDIR /var/cerb-docs

RUN bundle3.0 install

VOLUME ["/var/cerb-docs"]
EXPOSE 4000

CMD ["bundle3.0","exec","jekyll","serve","-H","0.0.0.0","--incremental"]