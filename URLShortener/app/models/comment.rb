class Comment < ActiveRecord::Base
  attr_accessible :body, :short_url_id, :user_id
  belongs_to :short_url
  belongs_to :user
end