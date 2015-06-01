class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |x|
      x.string :comment
      x.integer :status_id
      x.integer :user_id
    end
  end
end
