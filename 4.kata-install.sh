#!/bin/bash

cd /home/ec2-user/newrelic-ruby-kata

rvm rvmrc warning ignore allGemfiles
rvm install "ruby-2.2.2"

bundle install