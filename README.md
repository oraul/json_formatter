# Json Formatter

Easy plug and play json logger formatter

## Setup Rails

Configure only on production (config/initializers/production.rb)

```ruby
config.log_formatter = JsonFormatter.new
```

## Debug gem

```sh
docker run --rm -it -v $(pwd):/usr/src/app -w /usr/src/app ruby:3.1.2-alpine sh
```
