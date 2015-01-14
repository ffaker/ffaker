[![Build Status](https://travis-ci.org/EmmanuelOga/ffaker.svg?branch=master)](https://travis-ci.org/EmmanuelOga/ffaker) [![Code Climate](https://codeclimate.com/github/EmmanuelOga/ffaker/badges/gpa.svg)](https://codeclimate.com/github/EmmanuelOga/ffaker)
# ffaker

[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/EmmanuelOga/ffaker?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

[ffaker](http://rubygems.org/gems/ffaker) is a rewrite of [faker](http://rubygems.org/gems/faker).

## Usage

```ruby
require 'ffaker'
Faker::Name.name => "Christophe Bartell"
Faker::Internet.email => "kirsten.greenholt@corkeryfisher.info"
```

## ffaker vs faker

The faker and ffaker APIs are mostly the same, although the API on ffaker keeps
growing with its users additions. In general, the only difference is that you
need to:

    gem install ffaker

and then

    require 'ffaker'

instead of "faker" with only one f.

## ffaker is faster... does it really matter?

<b>NO.</b>

ffaker was initially written in an effort to speed up a slow spec suite. Bear
in mind, if your spec suite is slow, chances are the generation of random data
will not account for much of the run time.

Since then, the original faker gem has become faster. But ffaker has
also gained a lot of new API methods from the generous contributions of
people all over the world.

Hopefully some day faker and ffaker will join forces!

## Contributors

A lot of people have contributed to ffaker. Check [this list](https://github.com/EmmanuelOga/ffaker/graphs/contributors).

If you want to add new modules or localization data, use one of the
[directories for data files](https://github.com/EmmanuelOga/ffaker/tree/master/lib/ffaker/data)
(or create a new one!).

**const_missing** is
[overriden](https://github.com/EmmanuelOga/ffaker/blob/master/lib/ffaker/utils/module_utils.rb#L9)
for Faker modules, so if you try to use a constant that is not defined
in the module, the
[override](https://github.com/EmmanuelOga/ffaker/blob/master/lib/ffaker/utils/module_utils.rb#L9)
will look for a data file matching the name of the constant. E.G.: the
first time someone accesses ++Faker::Name::FIRST_NAMES++, a const of that
name will be set with data from ffaker/data/name/first_names.

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

## Copyright

Copyright (c) 2013 Emmanuel Oga. See LICENSE for details.
Copyright (c) 2007 Benjamin Curtis
