class Syndication < ActiveRecord::Base
	scope :last_feed, -> (feed_name) { where(name: feed_name).last.body }
end
