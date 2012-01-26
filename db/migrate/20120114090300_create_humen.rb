class CreateHumen < ActiveRecord::Migration
  def change
    create_table :humen do |t|
      t.string :name
      t.date :board_date

      t.timestamps
    end
  end
end
