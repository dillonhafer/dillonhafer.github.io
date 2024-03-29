---
title:  Testing Subdomains with Capybara
tag: rails
---

Sometimes you’ll need to test subdomains. Here’s an easy helper method to do so.

```ruby
# Support for Rspec / Capybara subdomain integration testing
# Make sure this file is required by spec_helper.rb
#
# Sample subdomain test:
# it "should test subdomain" do
#   switch_to_subdomain("mysubdomain")
#   visit root_path
# end

DEFAULT_HOST = "lvh.me"
DEFAULT_PORT = 9887

RSpec.configure do |config|
 Capybara.default_host = "http://#{DEFAULT_HOST}"
 Capybara.server_port = DEFAULT_PORT
 Capybara.app_host = "http://#{DEFAULT_HOST}:#{Capybara.server_port}"
end

def switch_to_subdomain(subdomain)
 Capybara.app_host = "http://#{subdomain}.#{DEFAULT_HOST}:#{DEFAULT_PORT}"
end
```