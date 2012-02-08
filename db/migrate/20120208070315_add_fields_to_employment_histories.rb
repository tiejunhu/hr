class AddFieldsToEmploymentHistories < ActiveRecord::Migration
  def change
    add_column :employment_histories, :reason, :string
    add_column :employment_histories, :comment, :text
    add_column :humen, :employment_state, :string
  end
end
