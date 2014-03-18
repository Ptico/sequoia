# Sequoia

Sequoia is a gem for building environment-aware structures like configs, translations etc.

- [![Build Status](https://travis-ci.org/Ptico/sequoia.png)](https://travis-ci.org/Ptico/sequoia)
- [![Code Climate](https://codeclimate.com/github/Ptico/sequoia.png)](https://codeclimate.com/github/Ptico/sequoia)


## Installation

Add this line to your application's Gemfile:

    gem 'sequoia'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sequoia

## Usage

```ruby
tree = Sequoia::Configurator.new
tree.configure do
  working_folder '/srv'
  timeout 30
  database do
    adapter  'postgres'
    user     'app'
    password 'secret'
  end
end

tree.configure :production do
  timeout 60
  cache true
  database do
    user 'root'
  end
end

config = tree.build(:production)

config.working_folder #=> '/srv'
config.timeout #=> 60
config.database.user #=> 'root'
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
