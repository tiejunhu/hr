class CreateTitles < ActiveRecord::Migration
  def change
    create_table :titles do |t|
      t.string :title
      t.string :title_letter
      t.text :job_desc
      t.integer :salary_from
      t.integer :salary_to
      t.timestamps
    end
    create_table :levels do |t|
      t.string :level
      t.string :title_letter
      t.integer :salary_from
      t.integer :salary_to
      t.timestamps
    end
    
    add_column :humen, :title_id, :integer
  end
end
