---
title: rspec should receive thrice
tag: ruby
---

rspec has a `#thrice` method for testing receive counts:

```ruby
describe Account do
  context "when opened" do
    it "logger#account_opened was called once" do
      logger = double("logger")
      account = Account.new
      account.logger = logger

      logger.should_receive(:account_opened).thrice

      account.open
      account.open
      account.open
    end
  end
end
```
