class Status < ActiveRecord::Base
  belongs_to  :user
  has_many :statuses_tags
  has_many :tags, through: :statuses_tags
  has_many :likes
  has_many :comments
  # Remember to create a migration!
end
