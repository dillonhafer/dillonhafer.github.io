---
title: Check if in transaction in rails
tag: rails
---

`ActiveRecord::ConnectionAdapters::DatabaseStatements` can list open transactions, if there are none, chances are you're not in a transaction.

```ruby
class WriteALot < ApplicationRecord
  def self.vacuum
    if connection.open_transactions.blank?
      connection.execute("vacuum verbose analyze #{table_name}")
    end
  end
end

```
