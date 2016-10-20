FROM ubuntu:15.04
MAINTAINER david.morcillo@codegram.com

# Install dependencies
RUN apt-get update && \
    apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev \
                       libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev \
                       libxslt1-dev libcurl4-openssl-dev python-software-properties \
                       libffi-dev wget libmysqlclient-dev imagemagick libmagickwand-dev \
                       libpq-dev ghostscript qt5-default libqt5webkit5-dev \
                       gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x \
                       libxrender-dev libjpeg8-dev libjpeg8 fontconfig \
                       xfonts-base xfonts-75dpi && \
    rm -rf /var/lib/apt/lists*

# Install wkhtmltopdf
RUN wget -q http://download.gna.org/wkhtmltopdf/0.12/0.12.2.1/wkhtmltox-0.12.2.1_linux-trusty-amd64.deb && \
    dpkg --install wkhtmltox-0.12.2.1_linux-trusty-amd64.deb && \
    apt-get --yes --fix-broken install

# Install ruby 2.3.1
ENV RUBY_VERSION 2.3.1
RUN cd && wget http://ftp.ruby-lang.org/pub/ruby/2.3/ruby-$RUBY_VERSION.tar.gz && \
    tar -xzvf ruby-$RUBY_VERSION.tar.gz && cd ruby-$RUBY_VERSION/ && \
    ./configure && make && make install && rm -rf ruby-$RUBY_VERSION

# Install bundler
RUN echo "gem: --no-ri --no-rdoc" > ~/.gemrc && gem install bundler

# Install node
RUN curl -sL https://deb.nodesource.com/setup_5.x | bash && \
    apt-get install -y nodejs

WORKDIR /code

CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]
