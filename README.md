# Cm42::Os

## Installation

    $ gem build cm42-os.gemspec

    $ gem install cm42-os-0.1.0.gem

## Usage

```ruby
require 'codeminer_open_source'

os = CodeminerOpenSource::RepositoryList.new(file_path: "opensource-cm42.csv")

os.generate_csv
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).
