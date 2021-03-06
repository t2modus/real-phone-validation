# RealPhoneValidation

This gem is a simple API integration to RealPhoneValidation. T2 is using it primarily for the DNC API. Pull requests are welcome for any additional functionality.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'real_phone_validation'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install real_phone_validation

## Usage

Since currently we only support the one API, usage is pretty simple.

```
require 'real_phone_validation'
result = RealPhoneValidation::PhoneNumber.new('(801)-555-5555').dnc_lookup
result.dnc?
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/real_phone_validation. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the RealPhoneValidation project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/real_phone_validation/blob/master/CODE_OF_CONDUCT.md).
