class ShortUrl < ActiveRecord::Base
  attr_accessible :long_url_id, :user_id, :s_url, :tag_topic
  belongs_to :long_url
  belongs_to :user
  belongs_to :tag_topic
  has_many :visits
  has_many :comments
end
