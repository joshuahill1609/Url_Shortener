class LongUrl < ActiveRecord::Base
  attr_accessible :url
  has_many :short_urls
  has_many :tag_topics, :through => :short_urls

  validates :url, :presence => true
end