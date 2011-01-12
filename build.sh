#!/bin/sh
sudo gem uninstall ffaker-alt
gem build ffaker-alt.gemspec
sudo gem install $(ls ffaker-alt*.gem|tail -n 1)
