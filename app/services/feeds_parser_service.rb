class FeedsParserService
  def initialize(feed)
    @feed = feed
  end

  def parse_feed
    response = fetch_feed
    parse_feed_data(response)
  end

  private

  def fetch_feed
    HTTParty.get(@feed.url)
  end

  def parse_feed_data(response)
    rss_data = Nokogiri::XML(response.body)
    feed_items = []

    rss_data.css('item').each do |item|
      title = item.css('title').text
      link = item.css('link').text
      description = item.css('description').text
      pub_date = DateTime.parse(item.css('pubDate').text)
      img_tag = item.css('description').text.match(/<img[^>]+>/)[0] rescue ""
      html_content_without_img = item.css('description').text.gsub(/<img[^>]+>/, '')

      feed_item = {
        title: title,
        link: link,
        description: html_content_without_img,
        pub_date: pub_date,
        image: img_tag
      }

      if pub_date <= 10.minutes.ago
        article = Article.create!(
          feed: @feed,
          title: title,
          content: html_content_without_img,
          link: link,
          published_at: pub_date,
          display_image: img_tag
        )
      end

      feed_items << feed_item
    end

    feed_items
  end
end
