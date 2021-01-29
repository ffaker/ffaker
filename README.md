[![Build Status](https://github.com/ffaker/ffaker/workflows/Test/badge.svg)](https://github.com/ffaker/ffaker/actions?query=workflow%3ATest)
[![Code Climate](https://codeclimate.com/github/EmmanuelOga/ffaker/badges/gpa.svg)](https://codeclimate.com/github/EmmanuelOga/ffaker)
[![Reviewed by Hound](https://img.shields.io/badge/Reviewed_by-Hound-8E64B0.svg)](https://houndci.com)
# ffaker

[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/ffaker/ffaker?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

[ffaker](http://rubygems.org/gems/ffaker) is a rewrite of [faker](http://rubygems.org/gems/faker).

## Usage

```ruby
require 'ffaker'

FFaker::Name.name       #=> "Christophe Bartell"
FFaker::Internet.email  #=> "kirsten.greenholt@corkeryfisher.info"
```

**[See more →](REFERENCE.md)**

## ffaker vs faker

The faker and ffaker APIs are mostly the same, although the API on ffaker keeps
diverging with its users additions. In general, the only difference is that you
need to:

    gem install ffaker

and then

    require 'ffaker'

### Rails

1. If using rails then add the gem to your development and test environments:

```ruby
group :development, :test do
  gem 'ffaker'
end
```

2. and then run `bundle install` in your terminal/BASH/command line.

## Why ffaker?

ffaker is a fork of faker, and was initially written in an effort to speed up
a slow spec suite. Since those days faker has also been rewritten and the
"speed" factor is probably irrelevant now. Bear in mind, if your spec suite
is slow, chances are the generation of random data will probably not account
for much of the run time.

Nowadays the code bases have diverged enough to make the two projects truly
different: since ffaker creation, a lot of new API methods have been added
through the generous contributions of people all over the world.

Hopefully some day faker and ffaker will join forces!

## Contributors

A lot of people have contributed to ffaker. Check [this list](https://github.com/ffaker/ffaker/graphs/contributors).

If you want to add new modules or localization data, use one of the
[directories for data files](https://github.com/ffaker/ffaker/tree/main/lib/ffaker/data)
(or create a new one!).

**const_missing** is
[overriden](https://github.com/ffaker/ffaker/blob/main/lib/ffaker/utils/module_utils.rb#L9)
for Faker modules, so if you try to use a constant that is not defined
in the module, the
[override](https://github.com/ffaker/ffaker/blob/main/lib/ffaker/utils/module_utils.rb#L9)
will look for a data file matching the name of the constant. E.G.: the
first time someone accesses `FFaker::Name::FIRST_NAMES`, a const of that
name will be set with data from `ffaker/data/name/first_names`.

## Using the same random seed as your tests

To get repeatable results in Minitest or Rspec, follow [these instructions](RANDOM.md#using-the-same-random-seed-as-your-tests).

## Unique results

You can get unique value from any methods in FFaker like this:

```rb
FFaker::Name.unique.name
```

## TODO

* Even though the API is pretty simple, better rdoc documentation would not hurt.
* Put all modules under their respective languages (E.G. EducationUS instead of just Education)

## Note on Patches/Pull Requests

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Release

* Bump version in `lib/version.rb`.
* Update `Changelog.md`.
* Tag with `v<major>.<minor>.<patch>`.
* Push it.

## Copyright

Copyright (c) 2013 Emmanuel Oga. See LICENSE for details.
Copyright (c) 2007 Benjamin Curtis
