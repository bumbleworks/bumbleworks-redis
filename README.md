# Bumbleworks::Redis

Allows you to use a [Redis](http://redis.io) database for your [Bumbleworks](http://github.com/bumbleworks/bumbleworks) process storage.  Just including this gem in your gemfile will automatically register the adapter by default.

## Installation

Add this line to your application's Gemfile:

    gem 'bumbleworks-redis'

## Usage

Set Bumbleworks.storage to a Redis instance.  In a configure block, this looks like:

```ruby
Bumbleworks.configure do |c|
  c.storage = Redis.new(:host => '127.0.0.1', :db => 0, :thread_safe => true)
  # ...
end
```

Happy bumbling!

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
