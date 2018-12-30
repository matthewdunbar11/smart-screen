FROM ruby

RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g yarn

WORKDIR /src

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

CMD bundle exec rails s -b 0.0.0.0
