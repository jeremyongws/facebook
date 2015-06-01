class User < ActiveRecord::Base
  has_one :profile
  has_many :comments
  has_many :likes
  has_many :status
  validates :username, presence: true
  validates :username, uniqueness: true


  # has_many :friendships
  # has_many :friends, :through => :friendships
  # has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  # has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  def self.authenticate(username, password)
    if self.where(username: username)[0] == self.where(username: username, password: password)[0]
      return self.where(username: username)[0]
    else
      return nil
    end
  end
end
