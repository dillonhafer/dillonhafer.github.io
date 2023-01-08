---
title: ActiveStorage direct upload subfolders
tag: rails
---

When using S3, Rails does not let you configure subfolders for active storage. Every attachment lives at the root of your bucket.

_This is not recommended, but cannot be helped_

The only way to store attachments into subfolders is to monkey patch the direct uploads controller:

```rb
# config/initializer/direct_uploads_monkey_path.rb
Rails.application.config.to_prepare do
  class ActiveStorage::DirectUploadsController < ActiveStorage::BaseController
    def create
      key = "#{sub_dir}/#{user.id}/#{ActiveStorage::Blob.generate_unique_secure_token}"
      upload_attrs = {key:}.merge(blob_args)
      blob = ActiveStorage::Blob.create_before_direct_upload!(**upload_attrs)
      render json: direct_upload_json(blob)
    end

    private

    def user
      @user ||= User.enabled.find(session[:current_user_id])
    end

    def sub_dir
      if /cool-uploads/.match?(request.referer)
        "cool-uploads"
      elsif /company-settings/.match?(request.referer)
        "companies"
      else
        "uploads"
      end
    end
  end
end

```
