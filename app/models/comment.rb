class Comment < ActiveRecord::Base
  belongs_to :status
  belongs_to :user
  # Remember to create a migration!
end
