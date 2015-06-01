class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |y|
      y.integer :user_id
      y.string :status
    end
  end
end
