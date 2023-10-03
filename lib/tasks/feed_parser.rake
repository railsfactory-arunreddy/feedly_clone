namespace :feed_parser do
  desc "Parse the feed to update articles"
  @feed_parser_logger ||= Logger.new("#{Rails.root}/log/feed_parser.log")
  task get_latest_feed: :environment do
    begin
      @feeds = Feed.all
      @feeds.each do |feed|
        begin
          @feed_parser_logger.info("Parsing feeds for - #{feed.id}")
          feed_parser = FeedsParserService.new(feed).parse_feed
          @feed_parser_logger.info("Parsed feeds for - #{feed.id}")
        rescue StandardError => e
          @feed_parser_logger.error(e.to_s)
          next
        end
      end
    rescue StandardError => e
      @feed_parser_logger.error(e.to_s)
    end
  end
end