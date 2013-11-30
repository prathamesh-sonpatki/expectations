![Build Status](https://api.travis-ci.org/prathamesh-sonpatki/expectations.png)

# Work in progress

# Expectations

Sometimes we need to validate our input before proceeding.

For eg. 

``` ruby
if params[:user] && params[:user][:auth_details] 
  ...
else
  ...
end
```

This makes code look bad. Also doesn't convey our expectations about
the input.

We can write RSpec like syntax for our inputs.

For eg.

``` ruby
expect(params).to_have_key(:user)                #=> true/false
expect(params[:user]).to_have_key(:auth_details) #=> true/false
```
We can also pass a block which will be yieled when the input
expectation is failed

``` ruby
expect(params).to_have_key(:user) do |obj|
   obj.errors.join(", ")
end

# => "Expected key :user to be present. Not found."
```
## Installation

### Don't install yet!!

Add this line to your application's Gemfile:

    gem 'expectations'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install expectations

## Usage

## TODO:

1. Add more object types
2. Add more validation methods
3. Make yielding of block more flexible
4. Think more!!

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
