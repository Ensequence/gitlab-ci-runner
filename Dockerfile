FROM ubuntu:12.04

MAINTAINER weisjohn "weis.john@gmail.com"


# deps

RUN apt-get update -y
RUN apt-get install -y curl git build-essential libicu-dev

# ruby

RUN bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)

RUN source /etc/profile.d/rvm.sh

RUN rvm install 1.9.3

RUN gem install bundler


# code 

RUN git clone https://github.com/Ensequence/gitlab-ci-runner.git runner && cd runner


# install deps

RUN bundle install

