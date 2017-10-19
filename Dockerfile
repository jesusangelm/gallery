FROM ruby:2.2.7-jessie  
MAINTAINER jam@jam.net.ve  

# Install apt based dependencies required to run Rails as   
# well as RubyGems. As the Ruby image itself is based on a   
# Debian image, we use apt-get to install those.  
RUN apt-get update && apt-get install -y \  
  build-essential \  
  nodejs \  
  libpq-dev \  
  postgresql-client \  
  imagemagick \
  --no-install-recommends && rm -rf /var/lib/apt/lists/*  

# Configure the main working directory. This is the base   
# directory used in any further RUN, COPY, and ENTRYPOINT   
# commands.  
RUN mkdir -p /app  
WORKDIR /app  

# ad ENV vars  
ENV RAILS_ENV=production  
ENV RACK_ENV=production  
ENV PORT=3000  
ENV DEVISE_SECRET_KEY=aUtXj6BijX1dG2Y59cgGcBIHf3Rcwfb7rvMV5aM8i3e3XO0HAT  
ENV SECRET_KEY_BASE=SVXISr0GvB99I5xQN7Bi6A2uAlyFPzziNoCOaB0DOqN3xNvdK6  
#ENV RAILS_SERVE_STATIC_FILES true  # Genera problemas con assets
ENV RAILS_LOG_TO_STDOUT true

# Copy the Gemfile as well as the Gemfile.lock and install 
# the RubyGems. This is a separate step so the dependencies 
# will be cached unless changes to one of those two files 
# are made.
COPY Gemfile /app/
COPY Gemfile.lock /app/
RUN gem install bundler && bundle install --jobs 20 --retry 5

# Copy the main application.
COPY . /app

# precompile assets
RUN bundle exec rake DATABASE_URL=postgresql:does_not_exist assets:precompile

# Expose port 3000 to the Docker host, so we can access it 
# from the outside.
EXPOSE 3000

# Configure an entry point, so we don't need to specify 
# "bundle exec" for each of our commands.
ENTRYPOINT ["bundle", "exec"]

# The main command to run when the container starts. Also 
# tell the Rails dev server to bind to all interfaces by 
# default.
CMD ["rails", "server", "-b", "0.0.0.0"]
