class Visit < ActiveRecord::Base
  attr_accessible :user_id, :short_url_id
  belongs_to :users
  belongs_to :short_urls

  validates :user_id, :short_url_id, :presence => true
end
