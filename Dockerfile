FROM ubuntu:12.04

MAINTAINER weisjohn "weis.john@gmail.com"


# deps

RUN apt-get update -y
RUN apt-get install -y -q wget git build-essential libicu-dev


# ruby

## get ruby-install
RUN wget -O ruby-install-0.1.4.tar.gz https://github.com/postmodern/ruby-install/archive/v0.1.4.tar.gz
RUN tar -xzvf ruby-install-0.1.4.tar.gz

## install ruby 1.9.3
RUN ruby-install-0.1.4/bin/ruby-install ruby 1.9.3 -i /opt/rubies/ruby-1.9.3

## cleanup and remove ruby-install
RUN rm -rf ruby-install-0.1.4/

## setup ruby path

ENV PATH $PATH:/opt/rubies/ruby-1.9.3/bin/

RUN gem install bundler




# code 

RUN git clone https://github.com/Ensequence/gitlab-ci-runner.git runner && cd runner


# install deps

RUN bundle install



# TODO: use CMD to be the runner step? http://docs.docker.io/en/latest/use/builder/#cmd