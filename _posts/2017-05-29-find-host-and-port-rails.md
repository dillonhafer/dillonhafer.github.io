---
title: Find host and port in development
---

Rails `5.1` is a little different the pre `5.1`

```ruby
require 'rails/commands/server/server_command'
```

In rails `5.0` or below

```ruby
require 'rails/commands/server'
```

```ruby
# lib/host_and_port.rb

def __host_and_port__
  options = Rails::Server::Options.new.parse!(ARGV)
  options.values_at(:Host, :Port)
end
```

You can then find the host and port for various configuration files.

```ruby
# config/initializers/carrier_wave.rb
require Rails.root.join('lib/host_and_port').to_s

CarrierWave.configure do |config|
  config.asset_host = "http://" + __host_and_port__.join(":")
end
```

or

```ruby
# config/environments/development.rb
require Rails.root.join('lib/host_and_port').to_s

host, port = __host_and_port__
config.action_mailer.default_url_options = { host: host, port: port }
```
