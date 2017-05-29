# Mockable #

Mockable is a quick and dirty interface that lets you know if your user wants
you to use mocked interfaces and such.

## WHY?!?!?!?! ##

Well, because I write a lot of API clients and such, and then I end up using
them in my apps. When I run tests against those apps, I find it easiest if
the library itself provides a transparent mocked interface.

I prefer to decide if mocking is desired by checking an environment variable,
because I write a lot of my app-level tests in languages other than Go. As
I do this sort of thing quite a lot, occasionallly needing to enable mocking
for several clients at once, it finally made sense to just go ahead and
formalize the process and use a uniform environment variable, MOCKABLE,
for everything.


## Installation ##

Add this line to your application's Gemfile:

```ruby
gem 'mockable'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mockable

## Usage ##

Here's a quasi-real-world example. Let's say your library generates widgets.
Now, in production, you really want to make good, real, quality widgets. Under
test, though, the app that uses your widget generator may just need to ensure
that a widget gets generated. Here's how I like to handle that:

```ruby
require 'mockable'

module Factory
  Widget = Struct.new(:name)

  class Generator
    def generate(name)
    end
  end

  class Real < Generator
    def generate(name)
      # do a bunch of stuff that hits the real widget service out there in space
      # ...

      generated_widget
    end
  end

  class Fake < Generator
    def generate(name)
      Widget.new(name)
    end
  end

  def self.generator
    Mockable.mocked? ? Fake : Real).new
  end
end
```

Now, when the above is used and `Factory.generator` is called, a fake
generator is returned if mocking is enabled (by setting the `MOCKABLE`
environment variable to pretty much anything), but a real generator otherwise.

## Development ##

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

***NOTE: This project uses git-flow. Please base your feature branches off of the develop branch.***

1. Fork it ( https://github.com/ess/mockable/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request



## History ##

