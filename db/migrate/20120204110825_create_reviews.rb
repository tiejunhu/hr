class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.string :state
      t.timestamps
    end
  end
end
