FROM 8cb4d8d09c6d

#FROM ubuntu:12.04

MAINTAINER weisjohn "weis.john@gmail.com"


# deps

#RUN apt-get update -y
#RUN apt-get install -y curl git build-essential libicu-dev

# ruby

RUN curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer | bash -s standard

RUN source /etc/profile.d/rvm.sh

RUN rvm install 1.9.3

RUN gem install bundler


# code 

RUN git clone https://github.com/Ensequence/gitlab-ci-runner.git runner && cd runner


# install deps

RUN bundle install

