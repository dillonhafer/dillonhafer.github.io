---
title: 📧 Change the delivery method of a mailer
tag: rails
---

You can change the delivery method of a mailer with the `default` method:

```ruby
Rails.application.config.action_mailer.delivery_method
=> :smtp

class LocalMailer < ApplicationMailer
  default delivery_method: :sendmail

  def notify_root
    mail({to: "root@localhost", subject: "Alert"})
  end
end

LocalMailer.notify_root.deliver_now
```

Then check the inbox:

```shell
sudo su root
mail
Mail version 8.1 6/6/93.  Type ? for help.
"/var/mail/root": 1 message 1 new
>N  1 no-reply@rails-app.example.com     Fri Aug 19 17:29 494/19390 "Alert"
?

```
