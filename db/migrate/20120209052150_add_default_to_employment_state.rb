class AddDefaultToEmploymentState < ActiveRecord::Migration
  def change
    change_column :humen, :employment_state, :string, :default => "normal"
  end
end
