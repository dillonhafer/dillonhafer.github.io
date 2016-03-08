---
title: Keep Mina Fast
---

One thing I've loved about [mina](http://nadarei.co/mina) is the speed of deployments. One way mina achieves fast deploys is by avoiding unnecessary tasks.

I recently started using [webpack](https://webpack.github.io) with rails and soon found I needed that same performance boost. Because I was using `mina/rails` I had a nice little macro already available for me 😁

**Example of  `#check_for_changes_script`**

```ruby
desc "Install npm dependencies"
task :install do
  queue check_for_changes_script \
    check: 'package.json',
    at: ['package.json'],
    skip: %[echo "-----> Skipping npm installation"],
    changed: %[
      echo "-----> #{message}"
      #{echo_cmd %[NODE_ENV=#{ENV['to']} npm install]}
    ],
    default: %[
      echo "-----> Installing npm modules"
      #{echo_cmd %[NODE_ENV=#{ENV['to']} npm install]}
    ]
end
```

h/t [Hashrocket til](https://til.hashrocket.com/posts/00cb1df00b-keep-mina-fast)