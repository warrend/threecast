class Threecast::News
  attr_accessor :story, :url, :network, :date

  def self.today
    self.scrape_deals
  end

  def self.scrape_deals
    news = []

    news << self.scrape_cnn
    news << self.scrape_msnbc
    news << self.scrape_foxnews

    news
  end

  def self.scrape_cnn
    doc = Nokogiri::HTML(open("https://twitter.com/cnn"))
    self.news_creator(doc)
  end

  def self.scrape_msnbc
    doc = Nokogiri::HTML(open("https://twitter.com/msnbc"))
    self.news_creator(doc)
  end

  def self.scrape_foxnews
    doc = Nokogiri::HTML(open("https://twitter.com/foxnews"))
    self.news_creator(doc)
  end

  def self.news_creator(doc)
    news = self.new
    news.story = doc.search(".js-tweet-text-container p").first.text
    news.url = doc.search(".js-tweet-text-container p a").attr("href").value
    news.network = doc.search(".account-group .fullname").first.text
    news.date = doc.search(".stream-item-header .time a").attr("title").value

    news
  end
end
