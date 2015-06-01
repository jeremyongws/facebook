class Tag < ActiveRecord::Base
  has_many :statuses_tags
  has_many :statuses, through: :statuses_tags
  validates :tag, uniqueness: true
  # Remember to create a migration!
end
