desc "Run dev server"
task :server do
  `open http://localhost:4000; bundle exec jekyll serve`
end

desc "Scrape"
task :scrape, [:posts] do |t, args|
  posts = args.fetch(:posts, 10)
  `ruby scraper.rb dillonhafer #{posts}`
end

task default: :server
