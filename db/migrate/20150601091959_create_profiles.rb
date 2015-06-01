class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |p|
      p.integer :user_id
      p.string :name
      p.string :age
      p.string :description
      p.timestamps
    end
  end
end
