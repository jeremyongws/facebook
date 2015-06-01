class CreateStatusesTags < ActiveRecord::Migration
  def change
    create_table :statuses_tags do |t|
      t.integer :tag_id
      t.integer :status_id
    end
  end
end
