class CreateEmploymentHistories < ActiveRecord::Migration
  def change
    create_table :employment_histories do |t|
      t.integer :human_id
      t.integer :level_id
      t.integer :title_id
      t.date :start_from
      t.date :end_at
      t.integer :monthly_pay
      t.float :base_rate, :default => 0.8
      t.integer :pay_month_per_year, :default => 15
      t.timestamps
    end
  end
end
