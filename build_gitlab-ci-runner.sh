#!/bin/bash

## get the right PATH

source /root/.profile

## installs gitlab-ci-runner

gem install bundler

## move into the runner folder

cd runner

## build the deps

bundle install

