class User < ActiveRecord::Base
  has_many :short_urls
  has_many :visits
  has_many :comments

  validates :user_name, :email, :presence => true
  validates :user_name , :uniqueness => true
  validates :email, :uniqueness => true
end