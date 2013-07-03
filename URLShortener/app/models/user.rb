class User < ActiveRecord::Base
  has_many :short_urls
  has_many :visits
  has_many :comments
end