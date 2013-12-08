# ShaCache

If you want to avoid heavy data processing for the same responses from 3rd party API? ShaCache allows you to do it by caching sha of responses

## The problem

1. You send request to server /user/profile.json and get following response:
    {"username": "Janis"}

2. You do some processing based on that data
3. You make request second time and response stays the same:
    {"username": "Janis"}
4. You do the processing again.

## The solution
1. You write a sha for each response.

    Scha::Client.write_data("your_unique_key", "{'json': 'data'}")

2. Next time you check if sha is the same and if it is skip your processing

    if ShaCache::Client.has_data_with_key?("your_unique_key", "{'json': 'data'}")
      skip_data_processing
    else
      do_data_processing
    end

## Installation

Add this line to your application's Gemfile:

    gem 'sha_cache'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sha_cache

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
