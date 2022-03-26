---
title: Open iOS simulator app data directory
tag: workflow
---

If you need to quickly open an app's document directory on the iOS Simulator, you can quickly get the path from the `xcrun` CLI.

```shell
xcrun simctl get_app_container booted ${bundle_id} data
```

Here's some ruby you can throw into a `Rakefile` of your iOS app 😉

```ruby
# Rakefile
desc "Open the simulator document directory"
task :docs do
  bundle_id = File.read("MyAppName/MyAppName.xcodeproj/project.pbxproj")
    .scan(/PRODUCT_BUNDLE_IDENTIFIER = "(.*)"/)
    .flatten.first

  app_directory = `xcrun simctl get_app_container booted #{bundle_id} data`

  puts "Opening simulator directory: #{app_directory}"
  `open #{app_directory}`
end
```
