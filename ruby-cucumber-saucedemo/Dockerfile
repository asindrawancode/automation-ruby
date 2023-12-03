# Use an official Ruby runtime as the base image
FROM ruby:3.0

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

# Set the working directory in the container
WORKDIR /app

# Copy the Gemfile and Gemfile.lock from your project root to the working directory
COPY Gemfile Gemfile.lock ./

# Install the project dependencies
RUN gem install bundler:1.17.2
RUN bundle install

# Copy the rest of your project files to the working directory
COPY . .

# Set the default command to run your tests
CMD cucumber