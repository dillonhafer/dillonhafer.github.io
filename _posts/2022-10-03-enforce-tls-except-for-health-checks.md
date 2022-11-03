---
title: Enforce TLS... except for health checks
tag: rails
---

Many infrastructure stability platforms will need to check the health of a rails application directly, not through a load balancer. Because many applications don't terminate TLS directly (because it's delegated to the load balancer) a health check endpoint must adhere the the `force_ssl = true` config option, but without TLS, causing a failure. 

Rails 7 has an option to work around this (`config.ssl_options`):

```ruby
# config/environments/production.rb
# Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
config.force_ssl = true
config.ssl_options = {
  redirect: {exclude: ->(request) { /healthz/.match?(request.path) }}
}
```
