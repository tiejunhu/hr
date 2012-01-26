class CreateSalaryHistories < ActiveRecord::Migration
  def change
    create_table :salary_histories do |t|
      t.integer :monthly_pay
      t.float :base_rate
      t.integer :pay_month_per_year
      t.integer :eval_interval
      t.date :effective_date
      t.integer :human_id
      t.timestamps
    end
  end
end
