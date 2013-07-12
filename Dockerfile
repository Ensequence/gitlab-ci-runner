from        ubuntu:12.04

maintainer  weisjohn "weis.john@gmail.com"

# apt-get deps

run         apt-get update -y
run         apt-get install -y -q sudo 
run         apt-get install -y -q wget 
run         apt-get install -y -q git 
run         apt-get install -y -q build-essential 
run         apt-get install -y -q libicu-dev



# ruby

## get ruby-install
run         wget -O ruby-install-0.1.4.tar.gz https://github.com/postmodern/ruby-install/archive/v0.1.4.tar.gz

run         tar -xzvf ruby-install-0.1.4.tar.gz

## install ruby 1.9.3
run         ruby-install-0.1.4/bin/ruby-install -i /usr/local/bin ruby 1.9.3 

## cleanup and remove ruby-install
run         rm -rf ruby-install-0.1.4/

## inject into the $PATH to ruby into the ~/.profile  (needed later)
#run         echo "export PATH=$PATH:/opt/rubies/ruby-1.9.3/bin" >> /root/.profile

## install bundler
run         gem install bundler

## grab gitlab-ci-runner 
run         git clone https://github.com/Ensequence/gitlab-ci-runner.git runner && cd runner


## install dependencies for gitlab-ci-runner

run         cd runner && bundle install 


run         echo "hello" # cache point

# TODO: use CMD to be the runner step? http://docs.docker.io/en/latest/use/builder/#cmd