class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.integer :human_id
      t.string :category
      t.string :log
      t.string :comment
      t.timestamps
    end
  end
end
