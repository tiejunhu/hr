class ChangeEmploymentHistories < ActiveRecord::Migration
  def change
    remove_column :employment_histories, :end_at
  end
end
