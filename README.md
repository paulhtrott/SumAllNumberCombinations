[![Build Status](https://travis-ci.org/paulhtrott/SumAllNumberCombinations.svg?branch=master)](https://travis-ci.org/paulhtrott/SumAllNumberCombinations)  [![Coverage Status](https://coveralls.io/repos/github/paulhtrott/SumAllNumberCombinations/badge.svg?branch=master)](https://coveralls.io/github/paulhtrott/SumAllNumberCombinations?branch=master)
# SumAllNumberCombinations

Sum all the numbers in a flattened array of numbers

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sum_all_number_combinations'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sum_all_number_combinations

## Usage

Create your instance variable, passing in the array you would like to sum all the combinations of.
```ruby
sum_of_all = SumAllCombinations.new([1,2,3])
```
Call the sum method and pass in the optional keyword arguments of remove_duplicates (default is false) and sort (default is true)
```ruby
sum_of_all.sum(remove_duplicates: true, sort: false)
```
The attributes available include:
```ruby
# passed in array
@original

# flattened array. After sum is called flattened will only include the numbers used for calculation, non-numeric objects  will be removed
@flattened

# calculated values array, which is the array holding all the numbers calculated from the addition of all of the possible number combinations, after sum is called 
@calculated_values

#combinations used array, which is the array holding all the information of how the numbers were combined to determine results
@combinations_used
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/paulhtrott/sum_all_number_combinations.

