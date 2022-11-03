require "nokogiri"
require "net/http"

class Article < Struct.new(:node, :author, keyword_init: true)
  BASE_URL = "https://til.hashrocket.com"

  def self.fetch(author:, page: 1)
    author_url = URI("#{BASE_URL}/authors/#{author}?page=#{page}")
    raw_html = Net::HTTP.get_response(author_url)
    html = Nokogiri::HTML(raw_html.body)
    html.css("article.post").map do |node|
      new(node:, author:)
    end
  end

  def title
    title_node.text.force_encoding("utf-8")
  end

  def tag
    node.css(".post__tag-link").first.text.delete("#")
  end

  def file_name
    [
      "_posts",
      ([date, href].join("-") + ".md").force_encoding("utf-8")
    ].join("/")
  end

  def body
    found_end = false
    markdown.lines.map do |l|
      next(nil) if found_end
      found_end = l.start_with?(author)
      found_end ? nil : l
    end.delete_if { |a| a.nil? || a.start_with?(title.strip) }.join.strip.force_encoding("utf-8")
  end

  def write
    File.write(file_name, <<~MD)
      ---
      title: #{title}
      tag: #{tag}
      ---

      #{body}
    MD
  end

  private

  def date
    node.css("time").first["datetime"].split("T").first
  end

  def href
    title_node["href"].split("/").last.split("-")[1..].join("-")
  end

  def title_node
    node.css("h1 a").first
  end

  def markdown
    raw_path = node.css(".post__raw-link").first["href"]
    raw_url = URI("#{BASE_URL}#{raw_path}")
    Net::HTTP.get_response(raw_url).body.force_encoding("utf-8")
  end
end

username = ARGV[0]
posts = (ARGV[1] || 1).to_i

articles = []
page = 0
100.times do
  page += 1
  new_articles = Article.fetch(author: username, page:)
  articles.concat(new_articles)
  break if new_articles.length < 50
end

articles.take(posts).each.with_index do |a, i|
  a.write
  print("\b" * 25)
  print("Progress: #{i + 1}/#{posts} (possible: #{articles.length})")
end

puts "\nDone."
