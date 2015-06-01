class Like < ActiveRecord::Base
  validates_uniqueness_of :user_id, :scope => [:status_id]
  belongs_to :status
  belongs_to :user
  # Remember to create a migration!
end
