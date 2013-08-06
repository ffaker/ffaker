# ffaker

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

ffaker was initially written in an effort to speed up a slow spec suite. Bear
in mind, if your spec suite is slow, chances are the generation of random data
will not account for much of the run time.

Since then, the original faker gem has become faster.
Nevertheless, ffaker is still about 20x faster than faker.

```ruby
  N = 10_000

  Benchmark.bm do |rep|
    rep.report("generating #{ N } names") do
      N.times do
        Faker::Name.name
      end
    end
  end
```

```
ruby 1.8.7
generating 10000 names (faker 0.9.5)  1.500000   0.000000   1.500000 (  1.506865)
generating 10000 names (ffaker 1.5.0)  0.070000   0.000000   0.070000 (  0.067526)

ruby 1.9.2p180
generating 10000 names (faker 0.9.5)  1.030000   0.020000   1.050000 (  1.046116)
generating 10000 names (ffaker 1.7.0)  0.040000   0.000000   0.040000 (  0.045917)
```

## Contributors

A lot of people have contributed to ffaker. Check [this list](https://github.com/EmmanuelOga/ffaker/graphs/contributors).

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
