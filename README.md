# Unique Generator [![Build Status](https://secure.travis-ci.org/filtersquad/unique_generator.png?branch=master)](http://travis-ci.org/filtersquad/rocket_pants) [![Dependency Status](https://gemnasium.com/filtersquad/rocket_pants.png)](https://gemnasium.com/filtersquad/unique_generator)

## Introduction

Unique Generator is a plugin for ActiveRecord and MongoMapper which makes it simple to generate
unique fields and unique tokens.

Unique Generator is only available for Rails 3.0+.

## Installation

Installing Unique Generator is simple, just add the following to your Gemfile:

```ruby
gem 'unique_generator', '~> 1.0'
```

We'll automatically hook into ActiveRecord and MongoMapper via a railtie, adding three methods.

## Usage

Unique Generator defines a very simple method, adding only four methods:

* `YourModelClass.generate_random(length = 32)` - Generates a case sensitive field with size characters.
* `YourModelClass.generate_unique(length = 32, &block)` - Taking a block which defines the predicate of a given value,
  it will generate a random toke of the specified length until the block returns true.
* `YourModelClass#unique_field?(name)` - Called on an instance, tells you whether that instances value for a given
  field is unique in the database.

And finally, for most people, the only method that matters:

* `YourModelClass#generate_unique_field!(name, length = 32)` - Generates a random token of the specified length, combining
   the above methods to ensure it has a unique value.

**Note:** Please keep in mind, in your migration your field accepting a random token should ideally be case sensitive.

## Example

As a simple example, say we want to generate a unique invite token on a model, to do this, we'd do something like:

```ruby
class Invite < ActiveRecord::Base

  before_save :generate_invite_token

  def generate_invite_token
    generate_unique_field! :token, 32 if token.blank?
  end

end
```

## Contributors

- [Darcy Laycock](https://github.com/Sutto) - Main developer, current maintainer.

## Contributing

We encourage all community contributions. Keeping this in mind, please follow these general guidelines when contributing:

* Fork the project
* Create a topic branch for what you’re working on (git checkout -b awesome_feature)
* Commit away, push that up (git push your\_remote awesome\_feature)
* Create a new GitHub Issue with the commit, asking for review. Alternatively, send a pull request with details of what you added.
* Once it’s accepted, if you want access to the core repository feel free to ask! Otherwise, you can continue to hack away in your own fork.

Other than that, our guidelines very closely match the GemCutter guidelines [here](http://wiki.github.com/qrush/gemcutter/contribution-guidelines).

(Thanks to [GemCutter](http://wiki.github.com/qrush/gemcutter/) for the contribution guide)

## License

RocketPants is released under the MIT License (see the [license file](https://github.com/filtersquad/unique_generator/blob/master/LICENSE)) and is copyright Filter Squad, 2012.
