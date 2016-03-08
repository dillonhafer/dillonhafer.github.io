---
title: Complex Fragment Caching with Rails
---

**I CAN ONLY BEGIN THIS POST WITH THE INFAMOUS QUOTE FROM PHIL KARLTON:**

>There are only two hard things in Computer Science: cache invalidation and naming things.
>
>— Phil Karlton

The simple examples you’ll see about using [fragment caching](http://guides.rubyonrails.org/caching_with_rails.html#fragment-caching) in Rails do not consider complex relationships between objects. There’s nothing wrong with that at all; the guides could not possibly provide for every scenario. In this post, I hope to provide an example of cache invalidation for more complex fragmenting and relationships.

**HOW DID WE GET TO A MORE COMPLEX CACHE REQUIREMENT?**

I want to start by providing some context to the situation. We start with a show action for a model defined as Department. Department has several has_many relationships, one relationship being the class Item. The Items then get displayed on the Department’s show action, like a dashboard.

The has_many relationships are rendered by two levels of partials, index and show, each of which are cached. The index partial for each relationship loops through the related items, and the show partial for each individual related item. The Item class also has a belongs_to relationship to another model named Location. When the show partial for an Item gets rendered, the Item’s Location has its name rendered with it.

**WHERE THINGS START TO GET MORE COMPLEX**

Now we have a problem. We have an issue where a name change on a Location, the item’s other belongs_to relationship, doesn’t get displayed on the Department’s show action. This is due to the cache key at the Department’s index level. We are using a key that only looks at the Item’s maximum updated_at time, and doesn’t take into account that a Location may be updated separately from an Item.

So how can we allow updated information to propagate from the Item‘s other belongs_to model (Location) to theDepartment‘s show page so that it is displayed if the Location has been updated? On top of that, how do we accomplish it without hurting performance?

As we look at our cache key, we notice it’s based on the maximum updated time of our Item model, and we take no account for its other relationships.

```ruby
def complex_cache_key_for(scope)
  count          = @department.send(scope).count
  max_updated_at = @department.send(scope).maximum(:updated_at).try(:utc).try(:to_s, :number)
  ".../dept/#{@department.id}/#{...}/#{scope}/all-#{count}-#{max_updated_at}"
end
```

**MAKING THE COMPLEX SIMPLE**

The solution can actually be quite simple. We need to rewrite the way we calculate cache keys. In this instance the multiple has_many relationships can get by using this cache key. There’s only one model (Item) that includes its Location, so we really only need this cache key to be different for one model (Item).

First, let’s give every model a method they can use to determine their default cache key.

```ruby
module CollectionCacheKey
  extend ActiveSupport::Concern

  module ClassMethods
    def collection_cache_key
      max_updated_at = maximum(:updated_at).try(:utc).try(:to_s, :number)
      [count,max_updated_at].join('-')
    end
  end
end

ActiveRecord::Base.send(:include, CollectionCacheKey)
```

With all of our models now able to use this collection_cache_key method, we can update our helper method like so:

```ruby
def complex_cache_key_for(scope)
  collection_cache_key = @department.send(scope).collection_cache_key
  ".../dept/#{@department.id}/#{...}/#{type}/all-#{collection_cache_key}"
end
```

**MODIFYING OUR CACHE KEY**

With everything expiring properly, (except for our one stubborn model), we can now address the specific case of the Item‘s cache key. We know we can’t simply look at the update_at field on our Item, becasue we need to know if its Location has been updated as well. In this case we need to know the maximum update_at field on both the Item AND its Location.

Here we don’t want to use the SQL function MAX() because we need to return two values. So to get the max value of our updated_at field for an Item we can simply order by updated_at DESC and limit the query to the first result LIMIT 1. The reason for sorting this way is because we can now join this row with its Location. This will give us one row with two dates: items.updated_at and locations.updated_at. Now all we have to do is pick the latest date:

NOTE: To avoid multiple queries, our view is using @department.items.includes(:location)

```ruby
class Item < ActiveRecord::Base
  # ...

  def self.collection_cache_key
    latest         = order('updated_at DESC').take
    max_updated_at = [latest.updated_at, latest.location.updated_at].max
                     .try(:utc).try(:to_s, :number)
    [count,max_updated_at].join('-')
  end
end
```

The above method still only has to make two queries two find the count and the updated_at time, providing a very performant way to determine a complicated cache key.

And now our helper method will use this method only for our Item model, thus giving us a very flexible way to invalidate our cache keys.