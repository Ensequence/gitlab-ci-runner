#!/bin/bash

## get the right PATH

source /root/.profile

## installs gitlab-ci-runner

gem install bundler

## move into the gitlab-ci-runner folder

cd gitlab-ci-runner

## build the deps

bundle install

