class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |x|
      x.integer :user_id
      x.integer :status_id
    end
  end
end
