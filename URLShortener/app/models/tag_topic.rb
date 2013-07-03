class TagTopic < ActiveRecord::Base
  attr_accessible :tag
  has_many :long_urls, :through => :short_urls
  has_many :short_urls

end