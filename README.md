# ShaCache

If you want to avoid heavy data processing for the same responses from 3rd party API? ShaCache allows you to do it by caching sha of responses. After that you can skip data processing if data has not changed.

# Note

Still to test this working

## The problem

1. You send request to server /user/profile.json and get following response:

```json
    {"username": "Janis"}
```

2. You do some processing based on that data
3. You make request second time and response stays the same:

```json
    {"username": "janis"}
```

4. You do the processing again.

## The solution
1. You send request to server /user/profile.json and get following response:

```json
    {"username": "janis"}
```

2. You cache sha for response body wit unique key that suits you (It can be user.id or something else)

```ruby
SchCache::Client.write_data(user.id, "{/"username/": /"janis/"}")
```

3. Next time you check if SHA is the same for that response body and, if it is, skip your processing

```ruby
if ShaCache::Client.has_data_with_key?(user.id, "{/"username/": /"janis/"}")
  skip_data_processing
else
  do_data_processing
end
```

# Configuration
First of all, you will have to configure adapter (support is only available for Redis right now) but you can write your own:

```ruby
ShaCache::Config.config do |c|
  c.adapter = ShaCache::Adapter::Redis
end
```

After that you will need to pass redis instance you are working with:

```ruby
@redis_obj = Redis.new
ShaCahce::Adapters::Redis.config do |c|
  c.redis_obj = @redis_obj
end
```


## Installation

Add this line to your application's Gemfile:

    gem 'sha_cache'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sha_cache

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
