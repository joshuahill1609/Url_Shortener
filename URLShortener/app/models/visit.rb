class Visit < ActiveRecord::Base
  attr_accessible :user_id, :short_url_id
  belongs_to :users
  belongs_to :short_urls
end
