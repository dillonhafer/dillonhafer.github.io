---
title: Rails has helpers for uploading spec fixture files
tag: rails
---

Instead of writing your own helper method in specs:

```ruby
module HelpMePlease
  def uploaded_file(path)
    Rack::Test::UploadedFile.new(Rails.root.join("spec/fixtures", path))
  end
end
```

Rails has a built in helper method: 

```ruby
require "rails_helper"

RSpec.describe HelpNeeded do
  describe "something" do
    it "sends the file" do
      post :change_avatar, params: { avatar: fixture_file_upload("spongebob.png", "image/png") }
    end
  end
end

```
