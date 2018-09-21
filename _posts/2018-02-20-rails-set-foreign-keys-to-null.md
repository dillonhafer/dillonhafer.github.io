---
title: 🔑 Set foreign keys to null with Rails
---

Sometimes, in certain circumstances, it is reasonable to have a foreign key value of null.

ActiveRecord's `.has_many` method has an argument to set the foreign key column on referencing rows to null when that record is deleted.

`dependent: :nullify`

Example:

```ruby
class Post < ApplicationRecord
  belongs_to :author
  belongs_to :category
end

class Category < ApplicationRecord
  has_many :posts, dependent: :nullify
end
```

In this example whenever a category is deleted, any posts referencing the `categories` table will have their foreign key set to null.

*References: <a href="http://api.rubyonrails.org/classes/ActiveRecord/Associations/ClassMethods.html#method-i-has_many-label-Options">http://api.rubyonrails.org/classes/ActiveRecord/Associations/ClassMethods.html#method-i-has_many-label-Options</a>
