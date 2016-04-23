# Mslabs Code Test

This is a small ruby application that adds items to a shopping basket and calculates
the cost including delivery and discounts.


## Installation

Assuming you have ruby installed, you may need to install bundler:

    $ gem install bundle

And then run bundler:

    $ bundle

## Usage

The programme has a command line interface that expects the path to a JSON file
as a parameter.

    $ ./bin/shop data/sample_products.json


For console access:

    $ ./bin/console

To run the tests:

    $ bundle exec rspec spec
